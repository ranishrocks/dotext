import 'dart:io';
import 'dart:isolate';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pytorch/flutter_pytorch.dart';

import '../../../core/tflite/classifier.dart';
import '../../../core/tflite/recognition.dart';
import '../../../utils/isolate_utils.dart';
import 'camera_view_singleton.dart';

/// [CameraView] sends each frame for inference
class CameraView extends StatefulWidget {
  /// Callback to pass results after inference to [HomeView]
  // final Function(List<Recognition> recognitions) resultsCallback;

  /// Constructor
  const CameraView({super.key});
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  /// List of available cameras
  List<CameraDescription>? cameras;

  /// Controller
  CameraController? cameraController;

  /// true when inference is ongoing
  bool? predicting;

  /// Instance of [Classifier]
  Classifier? classifier;

  /// Instance of [IsolateUtils]
  IsolateUtils? isolateUtils;

  @override
  void initState() {
    super.initState();
    initStateAsync();
  }

  void initStateAsync() async {
    WidgetsBinding.instance.addObserver(this);

    // Spawn a new isolate
    isolateUtils = IsolateUtils();
    await isolateUtils!.start();

    // Camera initialization
    initializeCamera();

    // Create an instance of classifier to load model and labels
    classifier = Classifier();

    // Initially predicting = false
    predicting = false;
  }

  /// Initializes the camera by setting [cameraController]
  void initializeCamera() async {
    cameras = await availableCameras();

    // cameras[0] for rear-camera
    cameraController =
        CameraController(cameras![0], ResolutionPreset.max, enableAudio: false);

    cameraController!.initialize().then((_) async {
      // Stream of image passed to [onLatestImageAvailable] callback
      await cameraController!.startImageStream(onLatestImageAvailable);

      /// previewSize is size of each image frame captured by controller
      ///
      /// 352x288 on iOS, 240p (320x240) on Android with ResolutionPreset.low
      Size previewSize = cameraController!.value.previewSize!;

      /// previewSize is size of raw input image to the model
      CameraViewSingleton.inputImageSize = previewSize;

      // the display width of image on screen is
      // same as screenWidth while maintaining the aspectRatio
      Size screenSize = MediaQuery.of(context).size;
      CameraViewSingleton.screenSize = screenSize;
      CameraViewSingleton.ratio = screenSize.width / previewSize.height;
    });
  }

  void _runObjectDetection() async {
    try {
      //pick an image
      final XFile? image = await cameraController?.takePicture();

      if(image != null){
        String pathObjectDetectionModel = "assets/models/braille_fixed_1500epoch.torchscript";
        var objectModel = await FlutterPytorch.loadObjectDetectionModel(
              pathObjectDetectionModel, 64, 640, 640,
              labelPath: "assets/labels/labels.txt");

        var objDetect = await objectModel.getImagePrediction(
          await File(image.path).readAsBytes(),
          minimumScore: 0.2,
          IOUThershold: 0.5
        );

        String wholeBraille = "";

        //TODO : change it to sort in two factor
        objDetect.sort((a, b) {
          if(a==null || b==null) return 0;
          return a.rect.left.compareTo(b.rect.left);
        });
        objDetect.forEach((element) {
          print({
            "score": element?.score,
            "className": element?.className,
            "class": element?.classIndex,
            "rect": {
              "left": element?.rect.left,
              "top": element?.rect.top,
              "width": element?.rect.width,
              "height": element?.rect.height,
              "right": element?.rect.right,
              "bottom": element?.rect.bottom,
            },
          });

        //   if(element?.className!=null){
        //     int detectedBraille = detectionToCharCode(element?.className as String);
        //     if(detectedBraille>0) wholeBraille += String.fromCharCodes([detectedBraille]);
        //   }
        });

        // var brailleResult = await SearchApiUseCase().searchBraille(wholeBraille);

        // if(brailleResult.runtimeType==List<TextBraillePair>){
        //   // ignore: use_build_context_synchronously
        //   RouteUtil().push(context, BrailleInfoListPage(textToBrailleList: brailleResult));
        // }
      }
      
    } catch (e) {
      print("error in running capture and ml : $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final scale = (cameraController!=null) 
      ? 1 / (cameraController!.value.aspectRatio * mediaSize.aspectRatio)
      : 1.0;

    // Return empty container while the camera is not initialized
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return Container();
    }

    return Stack(
      children: [
        ClipRect(
          clipper: _MediaSizeClipper(mediaSize),
          child: Transform.scale(
            scale: scale,
            alignment: Alignment.topCenter,
            child: CameraPreview(cameraController!)
          ),
        ),
        
        // Positioned(
        //   top: 250,
        //   left: 30,
        //   child: IconButton(
        //     onPressed: () {
        //       try {
        //         _runObjectDetection();
        //       } catch (e) {
        //         print("\n\n====\n\nerror while capturing and runing obj detct\n\n");
        //       }
              
        //     },
        //     icon: Icon(Icons.zoom_out_map_rounded)
        //   ),
        // )
      ],
    );
  }

  /// Callback to receive each frame [CameraImage] perform inference on it
  onLatestImageAvailable(CameraImage cameraImage) async {
    if (classifier!.interpreter != null) {
      // If previous inference has not completed then return
      if (predicting!) {
        return;
      }

      setState(() {
        predicting = true;
      });

      var uiThreadTimeStart = DateTime.now().millisecondsSinceEpoch;

      // Data to be passed to inference isolate
      var isolateData = IsolateData(
          cameraImage, classifier!.interpreter!.address, []);

      // We could have simply used the compute method as well however
      // it would be as in-efficient as we need to continuously passing data
      // to another isolate.

      /// perform inference in separate isolate
      Map<String, dynamic> inferenceResults = await inference(isolateData);

      // pass results to HomeView
      // widget.resultsCallback(inferenceResults["recognitions"]);

      // set predicting to false to allow new frames
      setState(() {
        predicting = false;
      });
    }
  }

  /// Runs inference in another isolate
  Future<Map<String, dynamic>> inference(IsolateData isolateData) async {
    ReceivePort responsePort = ReceivePort();
    isolateUtils!.sendPort!
        .send(isolateData..responsePort = responsePort.sendPort);
    var results = await responsePort.first;
    return results;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        cameraController!.stopImageStream();
        break;
      case AppLifecycleState.resumed:
        if (!cameraController!.value.isStreamingImages) {
          await cameraController!.startImageStream(onLatestImageAvailable);
        }
        break;
      default:
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    cameraController!.dispose();
    super.dispose();
  }
}


class _MediaSizeClipper extends CustomClipper<Rect> {
  final Size mediaSize;
  const _MediaSizeClipper(this.mediaSize);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
  }
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

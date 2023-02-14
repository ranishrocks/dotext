import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class TranslateCamPage extends StatefulWidget {
  const TranslateCamPage({Key? key}) : super(key: key);

  @override
  State<TranslateCamPage> createState() => _TranslateCamPageState();
}

class _TranslateCamPageState extends State<TranslateCamPage> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      controller = CameraController(cameras[0], ResolutionPreset.max);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              // Handle access errors here.
              break;
            default:
              // Handle other errors here.
              break;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final scale = 1 / (controller.value.aspectRatio * mediaSize.aspectRatio);

    if (!controller.value.isInitialized) {
      return Container();
    }
    
    return Scaffold(
      body: ClipRect(
        clipper: _MediaSizeClipper(mediaSize),
        child: Transform.scale(
          scale: scale,
          alignment: Alignment.topCenter,
          child: CameraPreview(controller),
        ),
      )
    );
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
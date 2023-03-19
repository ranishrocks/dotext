import 'dart:io';

import 'package:dot_connect_flutter/data/remote/use_case/search_api_use_case.dart';
import 'package:dot_connect_flutter/ui/pages/braille_info_list_page/braille_info_list_page.dart';
import 'package:dot_connect_flutter/utils/route/route_util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_pytorch/flutter_pytorch.dart';


import '../../../core/tflite/constant.dart';
import '../../../entities/braille_info_page_entity.dart';

class TranslateCamViewModel {
  ///detect object by ML model
  void runObjectDetection(BuildContext context, ModelObjectDetection _objectModel) async {
    //pick an image
    ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    var objDetect = await _objectModel.getImagePrediction(
      await File(image!.path).readAsBytes(),
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

      if(element?.className!=null){
        int detectedBraille = detectionToCharCode(element?.className as String);
        if(detectedBraille>0) wholeBraille += String.fromCharCodes([detectedBraille]);
      }
    });

    var brailleResult = await SearchApiUseCase().searchBraille(wholeBraille);

    if(brailleResult.runtimeType==List<TextBraillePair>){
      // ignore: use_build_context_synchronously
      RouteUtil().push(context, BrailleInfoListPage(textToBrailleList: brailleResult));
    }
  }

  ///Change result from braille detection ML to actual unicode(hexa)
  int detectionToCharCode(String className){
    Map<String, int> classMap = detectClassCodeMap.firstWhere(
      (element) => element.containsKey(className),
      orElse: () {
        return {className : -1};
      },
    );

    return classMap[className] ?? -1;
  }
}
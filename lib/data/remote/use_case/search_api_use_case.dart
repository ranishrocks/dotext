import '../../../entities/braille_info_page_entity.dart';
import '../dio/base_dio.dart';
import '../network_data/response/response_data.dart';

class SearchApiUseCase {
  searchKeyword(String keyword) async {
    try {
      final searchDioRes = await dio.get(
        "/translation",
        queryParameters: {"kor":keyword}
      );
      
      if(searchDioRes.data == null){
        final errorCode = NetworkErrorResp(errorCode: searchDioRes.statusCode, message: searchDioRes.statusMessage);
        return errorCode; 
      }

      List<BrailleInfoAPIResponse> resultList = (searchDioRes.data as List).map<BrailleInfoAPIResponse>((json) {
        return BrailleInfoAPIResponse.fromJson(json);
      }).toList();

      List<TextBraillePair> brailleInfoList = [];
      resultList.forEach((element) {
        brailleInfoList.add(TextBraillePair(text: element.str, braille: String.fromCharCodes(element.braille)));
      });

      return brailleInfoList;
      
    } catch (e) {
      print("error while translating text to braille : $e");
      return NetworkErrorResp(errorCode: 500);
    }
  }

  searchBraille(String braille) async {
    print("braille in searchBraille : $braille");
    try {
      final searchDioRes = await dio.post(
        "/translation/braille",
        data: {"braille": braille}
      );
      
      if(searchDioRes.data == null){
        final errorCode = NetworkErrorResp(errorCode: searchDioRes.statusCode, message: searchDioRes.statusMessage);
        return errorCode; 
      }

      List<BrailleInfoAPIResponse> resultList = (searchDioRes.data as List).map<BrailleInfoAPIResponse>((json) {
        return BrailleInfoAPIResponse.fromJson(json);
      }).toList();

      List<TextBraillePair> brailleInfoList = [];
      resultList.forEach((element) {
        brailleInfoList.add(TextBraillePair(text: element.str, braille: String.fromCharCodes(element.braille)));
      });

      return brailleInfoList;
      
    } catch (e) {
      print("error while translating braille to text : $e");
      return NetworkErrorResp(errorCode: 500);
    }
  }
}
import '../../../entities/braille_info_page_entity.dart';
import '../dio/base_dio.dart';
import '../network_data/response/response_data.dart';

class SearchApiUseCase {
  searchKeyword(String keyword) async {
    try {
      final searchResult = await dio.get<List<BrailleInfoAPIResponse>>(
        "/translation",
        queryParameters: {"kor":keyword}
      );
      
      if(searchResult.data == null){
        final errorCode = NetworkErrorResp(errorCode: searchResult.statusCode, message: searchResult.statusMessage);
        return errorCode; 
      }

      List<TextBraillePair> brailleInfoList = [];
      searchResult.data?.forEach((element) {
        brailleInfoList.add(TextBraillePair(text: element.str, braille: String.fromCharCodes(element.braille)));
      });

      print("searchKeyword, brailleInfoList : $brailleInfoList");

      return brailleInfoList;
      
    } catch (e) {
      print("error while translating text to braille : $e");
      return NetworkErrorResp(errorCode: 500);
    }
  }

  searchBraille(String braille) async {
    try {
      final searchDioRes = await dio.post(
        "/translation/braille",
        data: {"braille": braille}
      );

      print("searchResult : $searchDioRes");
      print("searchResult.data : ${searchDioRes.data}");
      print("searchResult.data.runtimeType : ${searchDioRes.data.runtimeType}");
      print("searchResult.data?[0].runtimeType : ${searchDioRes.data?[0].runtimeType}");
      
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

      print("searchBraille, brailleInfoList : $brailleInfoList");

      return brailleInfoList;
      
    } catch (e) {
      print("error while translating braille to text : $e");
      return NetworkErrorResp(errorCode: 500);
    }
  }
}
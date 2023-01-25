import 'dio/base_dio.dart';
import 'network_data/response/response_data.dart';


class Network {
  Future<NetworkResponse> getNameAPI() async {
    try {
      final nameResult = await dio.get<NameAPIResponse>("/name");
      
      if(nameResult.data == null){
        final errorCode = NetworkErrorResp(errorCode: nameResult.statusCode, message: nameResult.statusMessage);
        return errorCode; 
      }

      return nameResult.data!;
      
    } catch (e) {
      return NetworkErrorResp(errorCode: 500);
    }
  }
}
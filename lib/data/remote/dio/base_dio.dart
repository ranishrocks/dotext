import 'package:dio/dio.dart';

import '../network_const.dart';
import 'interceptor.dart';

BaseOptions options = BaseOptions(
  baseUrl: API_END_POINT_URL,
  connectTimeout: CONNECTION_TIMEOUT_MILLIS,
  receiveTimeout: RECEIVE_TIMEOUT_MILLIS,
);

Dio dio = Dio(options)
  ..interceptors.add(CustomLogInterceptor());
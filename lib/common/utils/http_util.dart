import 'package:dio/dio.dart';

class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: "http://192.168.1.193:8000",
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5),
        headers: {},
        contentType: "application/json: charset = utf-8",
        responseType: ResponseType.json);
    dio = Dio(options);
  }

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters, required queryParametrs}) async {
    var response =
        await dio.post(path, data: data, queryParameters: queryParameters);
    return response.data;
  }
}

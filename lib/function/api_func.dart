import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ApiFunction extends GetxService {
  var dio = Dio();
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  Future<ApiFunction> init() async {
    dio.options.baseUrl = "http://54.180.128.143:8080/api/v1"; //기본 url 인터셉터에 탑제

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.headers = headers; //request시에 header 탑재
      logger.i(options.headers);
      logger.i(options.uri);
      return handler.next(options);
    }, onResponse: (response, handler) {
      loggerNoStack.d(response.statusCode);
      loggerNoStack.d(response.data);
      return handler.next(response);
    }, onError: (DioError exception, handler) {
      logger.e(
          "statusCode : ${exception.response?.statusCode} \n statusMessage : ${exception.message}");
      return handler.next(exception);
    }));
    return this;
  }

  Map<String, String> get headers {
    Map<String, String> headers = {};
    headers['content-type'] = 'application/json; charset=utf-8';
    headers['accept'] = 'application/json; charset=utf-8';
    return headers;
  }
}

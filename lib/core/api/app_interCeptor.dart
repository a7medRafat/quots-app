// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
//
// class AppIntercepters extends Interceptor{
//
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     options.headers['X-Api-Key'] = 'JaxEVG9MEDEUYtVPU850fg==44VCXVB7jmoFKtFB';
//     debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
//     super.onRequest(options, handler);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
//     super.onResponse(response, handler);
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     debugPrint('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
//     super.onError(err, handler);
//   }
// }
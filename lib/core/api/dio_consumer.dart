// import 'dart:convert';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
// import 'package:quotes/core/api/api_consumer.dart';
// import 'package:quotes/core/api/app_interCeptor.dart';
// import 'package:quotes/core/api/status_code.dart';
// import 'package:quotes/injuctoin_container.dart ' as di;
//
// class DioConsumer implements ApiConsumer {
//   final Dio client;
//
//   DioConsumer({required this.client}) {
//     (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//         (HttpClient client) {
//       client.badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//       return client;
//     };
//     client.options
//       ..baseUrl = 'https://api.api-ninjas.com/v1/'
//       ..responseType = ResponseType.plain
//       ..followRedirects = false
//       ..validateStatus = (state) {
//         return state! < StatusCode.internalServerError;
//       };
//
//     client.interceptors.add(di.sl<AppIntercepters>());
//     client.interceptors.add(di.sl<LogInterceptor>());
//
//   }
//
//   @override
//   Future get(String path, {Map<String, dynamic>? queryParameter})async {
//     final response = await client.get(path,queryParameters: queryParameter);
//     return jsonDecode(response.data.toString());
//   }
// }

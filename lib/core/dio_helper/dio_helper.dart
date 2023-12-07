import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://api.api-ninjas.com/v1/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'X-Api-Key': 'JaxEVG9MEDEUYtVPU850fg==44VCXVB7jmoFKtFB',
        }));
  }

  Future<Response> getData({required String url}) async {
    return await dio!.get(url);
  }
}

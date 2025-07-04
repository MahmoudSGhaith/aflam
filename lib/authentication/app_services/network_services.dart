import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkServices {
  NetworkServices() {
    appServices();
  }

  late Dio dio;

  void appServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://route-movie-apis.vercel.app/",
        followRedirects: false,
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(request: true, requestHeader: true, requestBody: true),
    );
  }
}

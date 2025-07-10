
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() => Dio(BaseOptions(
    baseUrl: "https://yts.mx/api/v2/",
    receiveTimeout: const Duration(seconds: 10),
    connectTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
  ));
}
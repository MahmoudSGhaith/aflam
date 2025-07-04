import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:movies/authentication/data/data_sources/auth_data_source/auth_data_source.dart';
import 'package:movies/authentication/app_services/network_services.dart';

import '../../../app_services/storage_service.dart';

class AuthDataSourceImpl implements AuthDataSource {
  NetworkServices networkServices;

  AuthDataSourceImpl(this.networkServices);

  @override
  Future<Response> login({required String email, required String password}) {
    return networkServices.dio.post(
      "auth/login",
      data: {"email": email, "password": password},
    );
  }

  @override
  Future<Response> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avaterId,
  }) {
    return networkServices.dio.post(
      "auth/register",
      data: {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "phone": phone,
        "avaterId": avaterId,
      },
    );
  }

  @override
  Future<Response> resetPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final token = await StorageService.getToken();
    return networkServices.dio.patch(
      "auth/reset-password",
      data: {"oldPassword": oldPassword, "newPassword": newPassword},
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }
}

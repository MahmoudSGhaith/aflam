import 'package:movies/authentication/data/models/login/login_response_model/LoginResponse.dart';
import 'package:movies/authentication/data/models/register/register_response_model/RegisterResponse.dart';

import '../models/reset_password/reset_password_response/ResetPasswordResponse.dart';

abstract class AuthRepositories {
  Future<LoginResponse> login({
    required String email,
    required String password,
  });

  Future<RegisterResponse> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avaterId,
  });

  Future<ResetPasswordResponse> resetPassword({
    required String oldPassword,
    required String newPassword,
  });
}

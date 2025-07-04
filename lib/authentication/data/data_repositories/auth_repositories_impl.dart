import 'package:dio/dio.dart';
import 'package:movies/authentication/app_services/storage_service.dart';
import 'package:movies/authentication/data/data_repositories/auth_repositories.dart';
import 'package:movies/authentication/data/data_sources/auth_data_source/auth_data_source.dart';
import 'package:movies/authentication/data/models/login/login_response_model/LoginResponse.dart';
import 'package:movies/authentication/data/models/register/register_response_model/RegisterResponse.dart';
import 'package:movies/authentication/data/models/reset_password/reset_password_response/ResetPasswordResponse.dart';
import 'package:movies/authentication/error_handler/ErrorHandler.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  AuthDataSource authDataSource;

  AuthRepositoriesImpl(this.authDataSource);

  @override
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      var loginResponse = await authDataSource.login(
        email: email,
        password: password,
      );
      if (loginResponse.statusCode == 200) {
        LoginResponse data = LoginResponse.fromJson(loginResponse.data);
        await StorageService.saveToken(data.data!);
        return data;
      } else {
        var errorMessage = ErrorHandler.fromJson(loginResponse.data);
        throw errorMessage.message ?? "";
      }
    } on DioException catch (error, s) {
      var loginErrorMessage = ErrorHandler.fromJson(error.response?.data);
      throw loginErrorMessage.message ?? "";
    } catch (error, s) {
      print(error);
      print(s);
      rethrow;
    }
  }

  @override
  Future<RegisterResponse> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avaterId,
  }) async {
    try {
      var signUpResponse = await authDataSource.signUp(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone,
        avaterId: avaterId,
      );
      if (signUpResponse.statusCode == 201) {
        RegisterResponse data = RegisterResponse.fromJson(signUpResponse.data);
        return data;
      } else {
        var signUpErrorMessage = ErrorHandler.fromJson(signUpResponse.data);
        throw signUpErrorMessage.message ?? "";
      }
    } on DioException catch (error) {
      var errorMessage = ErrorHandler.fromJson(error.response?.data);
      throw errorMessage.message ?? "Unexpected error";
    } catch (error, s) {
      print(error);
      print(s);
      rethrow;
    }
  }

  @override
  Future<ResetPasswordResponse> resetPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try{
      var resetPasswordResponse = await authDataSource.resetPassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      if(resetPasswordResponse.statusCode == 200){
        ResetPasswordResponse data = ResetPasswordResponse.fromJson(resetPasswordResponse.data);
        return data;
      }else{
        var resetPasswordError = ErrorHandler.fromJson(resetPasswordResponse.data);
        throw resetPasswordError.message ??"";
      }
    }on DioException catch (error) {
      var errorMessage = ErrorHandler.fromJson(error.response?.data);
      throw errorMessage.message ?? "Unexpected error";
    } catch (error, s) {
      print(error);
      print(s);
      rethrow;
    }
  }
}

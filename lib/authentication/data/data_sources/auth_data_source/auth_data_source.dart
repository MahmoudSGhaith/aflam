
import 'package:dio/dio.dart';

abstract class AuthDataSource {
  Future<Response> login({required String email, required String password});
  Future<Response> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avaterId,
  });
  Future<Response> resetPassword({required String oldPassword , required String newPassword});
}
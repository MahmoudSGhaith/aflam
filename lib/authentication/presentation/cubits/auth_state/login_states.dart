
import 'package:movies/authentication/data/models/login/login_response_model/LoginResponse.dart';

sealed class LoginState {}

class InitState extends LoginState{}

class LoginLoadingState extends LoginState{}

class LoginSuccessState extends LoginState{
  final LoginResponse? successMessage;
  LoginSuccessState({this.successMessage});
}

class LoginErrorState extends LoginState{
  final String? errorMessage;
  LoginErrorState({this.errorMessage});
}

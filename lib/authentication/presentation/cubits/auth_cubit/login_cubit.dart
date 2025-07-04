import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/authentication/data/data_repositories/auth_repositories.dart';
import 'package:movies/authentication/presentation/cubits/auth_state/login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthRepositories authRepositories;

  LoginCubit(this.authRepositories) : super(InitState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  static LoginCubit get(context) => BlocProvider.of(context);


  Future<void> login() async {
    emit(LoginLoadingState());
    try {
      var loginResponse = await authRepositories.login(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(LoginSuccessState(successMessage: loginResponse));
    } catch (error) {
      emit(LoginErrorState(errorMessage: error.toString()));
    }
  }
}

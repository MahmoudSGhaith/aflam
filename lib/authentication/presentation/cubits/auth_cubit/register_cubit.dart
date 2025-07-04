import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/authentication/data/data_repositories/auth_repositories.dart';
import 'package:movies/authentication/presentation/cubits/auth_state/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  AuthRepositories authRepositories;
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  int avaterId = 1;

  RegisterCubit(this.authRepositories) : super(SignUpInitState());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> signUp() async {
    emit(SignUpLoading());
    try {
      var signUpResponse = await authRepositories.signUp(
        name: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: rePasswordController.text,
        phone: phoneNumberController.text,
        avaterId: avaterId,
      );
      emit(SignUpSuccess(successMessage: signUpResponse.message??""));
    } catch (error) {
      emit(SignUpError(errorMessage: error.toString()));
    }
  }
}

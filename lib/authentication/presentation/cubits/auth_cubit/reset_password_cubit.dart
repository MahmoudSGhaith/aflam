import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/authentication/data/data_repositories/auth_repositories.dart';
import 'package:movies/authentication/presentation/cubits/auth_state/reset_password_states.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  AuthRepositories authRepositories;

  ResetPasswordCubit(this.authRepositories) :super(InitState());

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  Future<void> resetPassword() async {
    emit(ResetPasswordLoading());
    try {
      var resetPasswordResponse = await authRepositories.resetPassword(
          oldPassword: oldPasswordController.text.trim(),
          newPassword: newPasswordController.text.trim());
      emit(ResetPasswordSuccess(successMessage: resetPasswordResponse.message));
    }catch(error){
      emit(ResetPasswordError(errorMessage: error.toString()));
    }
  }
}
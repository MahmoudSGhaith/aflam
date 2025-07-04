
sealed class ResetPasswordStates {}

class InitState extends ResetPasswordStates{}

class ResetPasswordLoading extends ResetPasswordStates{}

class ResetPasswordSuccess extends ResetPasswordStates{
  final String? successMessage;
  ResetPasswordSuccess({this.successMessage});
}

class ResetPasswordError extends ResetPasswordStates{
  final String? errorMessage;
  ResetPasswordError({this.errorMessage});
}

sealed class RegisterStates {}

class SignUpInitState extends RegisterStates{}

class SignUpLoading extends RegisterStates{}

class SignUpSuccess extends RegisterStates{
  final String? successMessage;
  SignUpSuccess({this.successMessage});
}

class SignUpError extends RegisterStates{
  final String? errorMessage;
  SignUpError({this.errorMessage});
}

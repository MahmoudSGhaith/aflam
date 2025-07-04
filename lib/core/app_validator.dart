class AppValidator {
  AppValidator._();

  static String? validateEmail(String? email) {
    RegExp emailRegEx = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (email == null || email.trim().isEmpty) {
      return "This filed is Required";
    } else if (emailRegEx.hasMatch(email) == false) {
      return "enter valid email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? password) {
    RegExp passwordRegEx = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (password == null || password.isEmpty) {
      return 'this field is required';
    } else if (password.length < 8) {
      return "enter strong password please";
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (password == null || password.isEmpty) {
      return "this field is required";
    }
    else if (password != confirmPassword) {
      return "please enter the same password";
    }
    else {
      return null;
    }
  }

  static String? validateUserName(String? userName) {
    RegExp usernameRegEx = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
    if (userName == null || userName.isEmpty) {
      return "this field is required";
    } else if (!usernameRegEx.hasMatch(userName)) {
      return "please enter valid user name";
    } else {
      return null;
    }
  }

  static String? validateFullName(String? fullName) {
    RegExp nameRegEx = RegExp(r"^[a-zA-Z\s]{3,}$");

    if (fullName == null || fullName.trim().isEmpty) {
      return "This field is required";
    } else if (!nameRegEx.hasMatch(fullName)) {
      return "name only letters not numbers";
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return " this filed is required";
    } else if (int.tryParse(phoneNumber.trim()) == null) {
      return " please enter numbers only";
    } else if (phoneNumber.length != 13) {
      return "phone number must be 13 number";
    } else {
      return null;
    }
  }
}

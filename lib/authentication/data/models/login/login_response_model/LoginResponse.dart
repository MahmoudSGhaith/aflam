class LoginResponse {
  LoginResponse({
      this.message, 
      this.data,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
  }
  String? message;
  String? data;
}
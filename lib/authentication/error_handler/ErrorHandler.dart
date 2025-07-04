class ErrorHandler {
  ErrorHandler({
      this.statusCode, 
      this.message,});

  ErrorHandler.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
  }
  num? statusCode;
  String? message;

}
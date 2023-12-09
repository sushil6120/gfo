class OtpVerifyModelClass {
  bool? success;
  String? message;
  String? userId;
  String? userType;
  String? token;

  OtpVerifyModelClass(
      {this.success, this.message, this.userId, this.userType, this.token});

  OtpVerifyModelClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    userId = json['userId'];
    userType = json['userType'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['token'] = this.token;
    return data;
  }
}

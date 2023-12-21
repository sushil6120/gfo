class ConsultantUserSingleDataModel {
  bool? success;
  String? message;
  Data? data;

  ConsultantUserSingleDataModel({this.success, this.message, this.data});

  ConsultantUserSingleDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? phone;
  String? otp;
  bool? isfillupdetails;
  bool? isSignupComplete;
  bool? isOTPVerified;
  String? signupExpiration;
  String? userType;
  List<Null>? rating;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? accountVerification;
  String? otpExpiration;
  String? email;
  String? name;

  Data(
      {this.sId,
      this.phone,
      this.otp,
      this.isfillupdetails,
      this.isSignupComplete,
      this.isOTPVerified,
      this.signupExpiration,
      this.userType,
      this.rating,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.accountVerification,
      this.otpExpiration,
      this.email,
      this.name});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    otp = json['otp'];
    isfillupdetails = json['isfillupdetails'];
    isSignupComplete = json['isSignupComplete'];
    isOTPVerified = json['isOTPVerified'];
    signupExpiration = json['signupExpiration'];
    userType = json['userType'];
    // if (json['rating'] != null) {
    //   rating = <Null>[];
    //   json['rating'].forEach((v) {
    //     rating!.add(new Null.fromJson(v));
    //   });
    // }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    accountVerification = json['accountVerification'];
    otpExpiration = json['otpExpiration'];
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    data['isfillupdetails'] = this.isfillupdetails;
    data['isSignupComplete'] = this.isSignupComplete;
    data['isOTPVerified'] = this.isOTPVerified;
    data['signupExpiration'] = this.signupExpiration;
    data['userType'] = this.userType;
    // if (this.rating != null) {
    //   data['rating'] = this.rating!.map((v) => v.toJson()).toList();
    // }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['accountVerification'] = this.accountVerification;
    data['otpExpiration'] = this.otpExpiration;
    data['email'] = this.email;
    data['name'] = this.name;
    return data;
  }
}

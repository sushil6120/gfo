class ConsultantSignUpModel {
  String? message;
  Data? data;

  ConsultantSignUpModel({this.message, this.data});

  ConsultantSignUpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? phone;
  String? otp;
  bool? isfillupdetails;
  String? userType;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.phone,
      this.otp,
      this.isfillupdetails,
      this.userType,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    otp = json['otp'];
    isfillupdetails = json['isfillupdetails'];
    userType = json['userType'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    data['isfillupdetails'] = this.isfillupdetails;
    data['userType'] = this.userType;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class SellerProfileModel {
  int? status;
  String? message;
  Data? data;

  SellerProfileModel({this.status, this.message, this.data});

  SellerProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
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
  String? userType;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? accNo;
  String? address;
  String? bankAccName;
  String? email;
  String? ifcsCode;

  Data(
      {this.sId,
      this.phone,
      this.otp,
      this.isfillupdetails,
      this.userType,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.accNo,
      this.address,
      this.bankAccName,
      this.email,
      this.ifcsCode});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    otp = json['otp'];
    isfillupdetails = json['isfillupdetails'];
    userType = json['userType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    accNo = json['AccNo'];
    address = json['address'];
    bankAccName = json['bankAccName'];
    email = json['email'];
    ifcsCode = json['ifcsCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    data['isfillupdetails'] = this.isfillupdetails;
    data['userType'] = this.userType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['AccNo'] = this.accNo;
    data['address'] = this.address;
    data['bankAccName'] = this.bankAccName;
    data['email'] = this.email;
    data['ifcsCode'] = this.ifcsCode;
    return data;
  }
}

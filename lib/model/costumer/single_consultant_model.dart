class SingleConsultantModel {
  Data? data;

  SingleConsultantModel({this.data});

  SingleConsultantModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? userType;
  // List<Null>? rating;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? accNo;
  String? address;
  String? bankAccName;
  int? consultantFee;
  String? education;
  String? email;
  String? experience;
  String? gender;
  String? ifcsCode;
  String? name;
  String? accountVerification;
  String? otpExpiration;

  Data(
      {this.sId,
      this.phone,
      this.otp,
      this.isfillupdetails,
      this.isSignupComplete,
      this.userType,
      // this.rating,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.accNo,
      this.address,
      this.bankAccName,
      this.consultantFee,
      this.education,
      this.email,
      this.experience,
      this.gender,
      this.ifcsCode,
      this.name,
      this.accountVerification,
      this.otpExpiration});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    otp = json['otp'];
    isfillupdetails = json['isfillupdetails'];
    isSignupComplete = json['isSignupComplete'];
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
    accNo = json['AccNo'];
    address = json['address'];
    bankAccName = json['bankAccName'];
    consultantFee = json['consultantFee'];
    education = json['education'];
    email = json['email'];
    experience = json['experience'];
    gender = json['gender'];
    ifcsCode = json['ifcsCode'];
    name = json['name'];
    accountVerification = json['accountVerification'];
    otpExpiration = json['otpExpiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    data['isfillupdetails'] = this.isfillupdetails;
    data['isSignupComplete'] = this.isSignupComplete;
    data['userType'] = this.userType;
    // if (this.rating != null) {
    //   data['rating'] = this.rating!.map((v) => v.toJson()).toList();
    // }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['AccNo'] = this.accNo;
    data['address'] = this.address;
    data['bankAccName'] = this.bankAccName;
    data['consultantFee'] = this.consultantFee;
    data['education'] = this.education;
    data['email'] = this.email;
    data['experience'] = this.experience;
    data['gender'] = this.gender;
    data['ifcsCode'] = this.ifcsCode;
    data['name'] = this.name;
    data['accountVerification'] = this.accountVerification;
    data['otpExpiration'] = this.otpExpiration;
    return data;
  }
}

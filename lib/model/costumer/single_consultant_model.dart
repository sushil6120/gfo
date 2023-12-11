class SingleConsultantModel {
  String? message;
  Data? data;

  SingleConsultantModel({this.message, this.data});

  SingleConsultantModel.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? phone;
  String? otp;
  bool? isfillupdetails;
  bool? isSignupComplete;
  String? userType;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? accNo;
  String? aadharCard;
  String? address;
  String? bankAccName;
  int? consultantFee;
  String? dob;
  String? education;
  String? educationDocument;
  String? email;
  String? experience;
  String? gender;
  String? ifcsCode;
  String? name;
  String? panCard;
  String? accountVerification;
  String? otpExpiration;
  bool? isOTPVerified;
  // List<Null>? rating;

  Data(
      {this.sId,
      this.phone,
      this.otp,
      this.isfillupdetails,
      this.isSignupComplete,
      this.userType,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.accNo,
      this.aadharCard,
      this.address,
      this.bankAccName,
      this.consultantFee,
      this.dob,
      this.education,
      this.educationDocument,
      this.email,
      this.experience,
      this.gender,
      this.ifcsCode,
      this.name,
      this.panCard,
      this.accountVerification,
      this.otpExpiration,
      this.isOTPVerified,
      // this.rating
      
      });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    otp = json['otp'];
    isfillupdetails = json['isfillupdetails'];
    isSignupComplete = json['isSignupComplete'];
    userType = json['userType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    accNo = json['AccNo'];
    aadharCard = json['aadharCard'];
    address = json['address'];
    bankAccName = json['bankAccName'];
    consultantFee = json['consultantFee'];
    dob = json['dob'];
    education = json['education'];
    educationDocument = json['educationDocument'];
    email = json['email'];
    experience = json['experience'];
    gender = json['gender'];
    ifcsCode = json['ifcsCode'];
    name = json['name'];
    panCard = json['panCard'];
    accountVerification = json['accountVerification'];
    otpExpiration = json['otpExpiration'];
    isOTPVerified = json['isOTPVerified'];
    // if (json['rating'] != null) {
    //   rating = <Null>[];
    //   json['rating'].forEach((v) {
    //     rating!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    data['isfillupdetails'] = this.isfillupdetails;
    data['isSignupComplete'] = this.isSignupComplete;
    data['userType'] = this.userType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['AccNo'] = this.accNo;
    data['aadharCard'] = this.aadharCard;
    data['address'] = this.address;
    data['bankAccName'] = this.bankAccName;
    data['consultantFee'] = this.consultantFee;
    data['dob'] = this.dob;
    data['education'] = this.education;
    data['educationDocument'] = this.educationDocument;
    data['email'] = this.email;
    data['experience'] = this.experience;
    data['gender'] = this.gender;
    data['ifcsCode'] = this.ifcsCode;
    data['name'] = this.name;
    data['panCard'] = this.panCard;
    data['accountVerification'] = this.accountVerification;
    data['otpExpiration'] = this.otpExpiration;
    data['isOTPVerified'] = this.isOTPVerified;
    // if (this.rating != null) {
    //   data['rating'] = this.rating!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class SellerRegisterModel {
  String? message;
  Seller? seller;

  SellerRegisterModel({this.message, this.seller});

  SellerRegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    seller =
        json['Seller'] != null ? new Seller.fromJson(json['Seller']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.seller != null) {
      data['Seller'] = this.seller!.toJson();
    }
    return data;
  }
}

class Seller {
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
  String? businessName;
  String? email;
  String? gstNo;
  String? ifcsCode;
  String? panCard;

  Seller(
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
      this.businessName,
      this.email,
      this.gstNo,
      this.ifcsCode,
      this.panCard});

  Seller.fromJson(Map<String, dynamic> json) {
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
    businessName = json['businessName'];
    email = json['email'];
    gstNo = json['gstNo'];
    ifcsCode = json['ifcsCode'];
    panCard = json['panCard'];
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
    data['businessName'] = this.businessName;
    data['email'] = this.email;
    data['gstNo'] = this.gstNo;
    data['ifcsCode'] = this.ifcsCode;
    data['panCard'] = this.panCard;
    return data;
  }
}

class ConsultantSignUpModel {
  String? message;
  User? user;
  Wallet? wallet;

  ConsultantSignUpModel({this.message, this.user, this.wallet});

  ConsultantSignUpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    return data;
  }
}

class User {
  String? otp;
  String? userType;
  String? createdAt;
  String? updatedAt;

  User({this.otp, this.userType, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    userType = json['userType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['userType'] = this.userType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Wallet {
  String? user;
  int? amount;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Wallet(
      {this.user,
      this.amount,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Wallet.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    amount = json['amount'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['amount'] = this.amount;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

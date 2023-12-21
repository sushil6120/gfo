class DefaultAddressModel {
  bool? success;
  String? message;
  Address? address;

  DefaultAddressModel({this.success, this.message, this.address});

  DefaultAddressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Address {
  String? sId;
  String? user;
  String? pinCode;
  String? address;
  String? locality;
  String? city;
  String? state;
  bool? isDefault;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Address(
      {this.sId,
      this.user,
      this.pinCode,
      this.address,
      this.locality,
      this.city,
      this.state,
      this.isDefault,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Address.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    pinCode = json['pinCode'];
    address = json['address'];
    locality = json['locality'];
    city = json['city'];
    state = json['state'];
    isDefault = json['isDefault'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['pinCode'] = this.pinCode;
    data['address'] = this.address;
    data['locality'] = this.locality;
    data['city'] = this.city;
    data['state'] = this.state;
    data['isDefault'] = this.isDefault;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

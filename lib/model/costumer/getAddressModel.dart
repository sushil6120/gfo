class Address {
  bool? success;
  String? message;
  List<Addresses>? addresses;

  Address({this.success, this.message, this.addresses});

  Address.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  String? sId;
  String? user;
  String? pinCode;
  String? address;
  String? locality;
  String? city;
  String? state;
  // bool? default;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Addresses(
      {this.sId,
      this.user,
      this.pinCode,
      this.address,
      this.locality,
      this.city,
      this.state,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Addresses.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    pinCode = json['pinCode'];
    address = json['address'];
    locality = json['locality'];
    city = json['city'];
    state = json['state'];
    // default = json['default'];
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
    // data['default'] = this.default;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

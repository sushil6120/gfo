class ApplyNocModel {
  String? message;
  Noc? noc;

  ApplyNocModel({this.message, this.noc});

  ApplyNocModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    noc = json['Noc'] != null ? new Noc.fromJson(json['Noc']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.noc != null) {
      data['Noc'] = this.noc!.toJson();
    }
    return data;
  }
}

class Noc {
  String? nocName;
  String? nocContact;
  String? nocAddress;
  String? nocDateAndTime;
  String? nocPinCode;
  String? nocSelectOption;
  String? nocStatus;
  String? applyBy;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Noc(
      {this.nocName,
      this.nocContact,
      this.nocAddress,
      this.nocDateAndTime,
      this.nocPinCode,
      this.nocSelectOption,
      this.nocStatus,
      this.applyBy,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Noc.fromJson(Map<String, dynamic> json) {
    nocName = json['nocName'];
    nocContact = json['nocContact'];
    nocAddress = json['nocAddress'];
    nocDateAndTime = json['nocDateAndTime'];
    nocPinCode = json['nocPinCode'];
    nocSelectOption = json['nocSelectOption'];
    nocStatus = json['nocStatus'];
    applyBy = json['applyBy'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nocName'] = this.nocName;
    data['nocContact'] = this.nocContact;
    data['nocAddress'] = this.nocAddress;
    data['nocDateAndTime'] = this.nocDateAndTime;
    data['nocPinCode'] = this.nocPinCode;
    data['nocSelectOption'] = this.nocSelectOption;
    data['nocStatus'] = this.nocStatus;
    data['applyBy'] = this.applyBy;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

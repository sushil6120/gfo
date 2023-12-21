class CreateBookingModel {
  bool? success;
  String? message;
  Booking? booking;

  CreateBookingModel({this.success, this.message, this.booking});

  CreateBookingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    booking =
        json['Booking'] != null ? new Booking.fromJson(json['Booking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.booking != null) {
      data['Booking'] = this.booking!.toJson();
    }
    return data;
  }
}

class Booking {
  String? userId;
  String? consultantId;
  String? bookingDate;
  String? status;
  int? paymentAmount;
  String? sId;
  int? iV;

  Booking(
      {this.userId,
      this.consultantId,
      this.bookingDate,
      this.status,
      this.paymentAmount,
      this.sId,
      this.iV});

  Booking.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    consultantId = json['consultantId'];
    bookingDate = json['bookingDate'];
    status = json['status'];
    paymentAmount = json['paymentAmount'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['consultantId'] = this.consultantId;
    data['bookingDate'] = this.bookingDate;
    data['status'] = this.status;
    data['paymentAmount'] = this.paymentAmount;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

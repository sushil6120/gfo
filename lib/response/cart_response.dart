

import 'package:gfo/response/status.dart';

class CartResponse<T> {
  Status? status;
  T? data;
  String? message;

  CartResponse(this.status, this.data, this.message);

  CartResponse.loading() : status = Status.LOADING;

  CartResponse.completed(this.data) : status = Status.COMPLETED;

  CartResponse.error(this.message) : status = Status.ERROR;

// @override
// String toString(){
//   return "Status : $status \n Message : $message \n Data : $data";
// }
}

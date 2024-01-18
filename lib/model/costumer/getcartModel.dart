class GetCartModel {
  int? status;
  String? message;
  List<CartData>? cartData;

  GetCartModel({this.status, this.message, this.cartData});

  GetCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['CartData'] != null) {
      cartData = <CartData>[];
      json['CartData'].forEach((v) {
        cartData!.add(new CartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.cartData != null) {
      data['CartData'] = this.cartData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartData {
  String? sId;
  List<Products>? products;
  String? orderby;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CartData(
      {this.sId,
      this.products,
      this.orderby,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CartData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    orderby = json['orderby'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['orderby'] = this.orderby;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Products {
  String? productId;
  int? quantity;
  String? sId;

  Products({this.productId, this.quantity, this.sId});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_Id'];
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_Id'] = this.productId;
    data['quantity'] = this.quantity;
    data['_id'] = this.sId;
    return data;
  }
}

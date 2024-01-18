class GetCartModel {
  String? sId;
  List<Products>? products;
  double? totalPrice;
  String? orderby;
  String? createdAt;
  String? updatedAt;
  int? iV;

  GetCartModel(
      {this.sId,
      this.products,
      this.totalPrice,
      this.orderby,
      this.createdAt,
      this.updatedAt,
      this.iV});

  GetCartModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
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
    data['totalPrice'] = this.totalPrice;
    data['orderby'] = this.orderby;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Products {
  ProductData? productData;
  int? quantity;
  String? sId;

  Products({this.productData, this.quantity, this.sId});

  Products.fromJson(Map<String, dynamic> json) {
    productData = json['productData'] != null
        ? new ProductData.fromJson(json['productData'])
        : null;
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productData != null) {
      data['productData'] = this.productData!.toJson();
    }
    data['quantity'] = this.quantity;
    data['_id'] = this.sId;
    return data;
  }
}

class ProductData {
  String? sId;
  String? title;
  int? requiredPrice;
  int? salePrice;
  List<String>? images;

  ProductData(
      {this.sId, this.title, this.requiredPrice, this.salePrice, this.images});

  ProductData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    requiredPrice = json['requiredPrice'];
    salePrice = json['salePrice'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['requiredPrice'] = this.requiredPrice;
    data['salePrice'] = this.salePrice;
    data['images'] = this.images;
    return data;
  }
}

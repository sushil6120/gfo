class UploadProductModel {
  bool? success;
  String? message;
  Product? product;

  UploadProductModel({this.success, this.message, this.product});

  UploadProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? title;
  String? sku;
  String? description;
  int? requiredPrice;
  int? salePrice;
  String? category;
  String? brand;
  int? quantity;
  String? tags;
  String? city;
  String? isManageStock;
  String? stockStatus;
  int? stockQuantity;
  String? allowBackOrders;
  String? lowStockHolder;

  String? status;
  String? sId;
  String? createdAt;
  String? updatedAt;
  String? slug;
  int? iV;

  Product(
      {this.title,
      this.sku,
      this.description,
      this.requiredPrice,
      this.salePrice,
      this.category,
      this.brand,
      this.quantity,
      this.tags,
      this.city,
      this.isManageStock,
      this.stockStatus,
      this.stockQuantity,
      this.allowBackOrders,
      this.lowStockHolder,
      this.status,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.slug,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    sku = json['sku'];
    description = json['description'];
    requiredPrice = json['requiredPrice'];
    salePrice = json['salePrice'];
    category = json['category'];
    brand = json['brand'];
    quantity = json['quantity'];
    tags = json['tags'];
    city = json['city'];
    isManageStock = json['isManageStock'];
    stockStatus = json['stockStatus'];
    stockQuantity = json['stockQuantity'];
    allowBackOrders = json['allowBackOrders'];
    lowStockHolder = json['lowStockHolder'];

    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    slug = json['slug'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['sku'] = this.sku;
    data['description'] = this.description;
    data['requiredPrice'] = this.requiredPrice;
    data['salePrice'] = this.salePrice;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['quantity'] = this.quantity;
    data['tags'] = this.tags;
    data['city'] = this.city;
    data['isManageStock'] = this.isManageStock;
    data['stockStatus'] = this.stockStatus;
    data['stockQuantity'] = this.stockQuantity;
    data['allowBackOrders'] = this.allowBackOrders;
    data['lowStockHolder'] = this.lowStockHolder;

    data['status'] = this.status;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['slug'] = this.slug;
    data['__v'] = this.iV;
    return data;
  }
}

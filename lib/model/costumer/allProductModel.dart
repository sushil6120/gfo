class AllProductModelClass {
  List<Products>? products;
  int? totalDoc;
  int? limits;
  int? pages;

  AllProductModelClass({this.products, this.totalDoc, this.limits, this.pages});

  AllProductModelClass.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    totalDoc = json['totalDoc'];
    limits = json['limits'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['totalDoc'] = this.totalDoc;
    data['limits'] = this.limits;
    data['pages'] = this.pages;
    return data;
  }
}

class Products {
  String? sId;
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
  String? postedBy;
  List<String>? images;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? slug;
  int? iV;

  Products(
      {this.sId,
      this.title,
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
      this.postedBy,
      this.images,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.slug,
      this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    postedBy = json['postedBy'];
    images = json['images'].cast<String>();
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    slug = json['slug'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
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
    data['postedBy'] = this.postedBy;
    data['images'] = this.images;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['slug'] = this.slug;
    data['__v'] = this.iV;
    return data;
  }
}

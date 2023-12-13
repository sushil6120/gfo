// class AllProductModel {
//   bool? success;
//   int? status;
//   List<Data>? data;

//   AllProductModel({this.success, this.status, this.data});

//   AllProductModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   int? viewCount;
//   // List<Null>? color;
//   String? sId;
//   String? title;
//   String? sku;
//   String? description;
//   int? requiredPrice;
//   int? salePrice;
//   String? category;
//   String? brand;
//   int? quantity;
//   String? tags;
//   String? city;
//   String? isManageStock;
//   String? stockStatus;
//   int? stockQuantity;
//   String? allowBackOrders;
//   String? lowStockHolder;
//   String? postedBy;
//   List<String>? images;
//   String? status;
//   String? createdAt;
//   String? updatedAt;
//   String? slug;
//   int? iV;
//   List<Rating>? rating;
//   String? firstImage;
//   String? totalRating;
//   int? totalReview;
//   int? price;
//   String? postedby;
//   String? totalrating;

//   Data(
//       {this.viewCount,
//       // this.color,
//       this.sId,
//       this.title,
//       this.sku,
//       this.description,
//       this.requiredPrice,
//       this.salePrice,
//       this.category,
//       this.brand,
//       this.quantity,
//       this.tags,
//       this.city,
//       this.isManageStock,
//       this.stockStatus,
//       this.stockQuantity,
//       this.allowBackOrders,
//       this.lowStockHolder,
//       this.postedBy,
//       this.images,
//       this.status,
//       this.createdAt,
//       this.updatedAt,
//       this.slug,
//       this.iV,
//       this.rating,
//       this.firstImage,
//       this.totalRating,
//       this.totalReview,
//       this.price,
//       this.postedby,
//       this.totalrating});

//   Data.fromJson(Map<String, dynamic> json) {
//     viewCount = json['viewCount'];
//     if (json['color'] != null) {
//       // color = <Null>[];
//       // json['color'].forEach((v) {
//       //   color!.add(new Null.fromJson(v));
//       // });
//     }
//     sId = json['_id'];
//     title = json['title'];
//     sku = json['sku'];
//     description = json['description'];
//     requiredPrice = json['requiredPrice'];
//     salePrice = json['salePrice'];
//     category = json['category'];
//     brand = json['brand'];
//     quantity = json['quantity'];
//     tags = json['tags'];
//     city = json['city'];
//     isManageStock = json['isManageStock'];
//     stockStatus = json['stockStatus'];
//     stockQuantity = json['stockQuantity'];
//     allowBackOrders = json['allowBackOrders'];
//     lowStockHolder = json['lowStockHolder'];
//     postedBy = json['postedBy'];
//     images = json['images'].cast<String>();
//     status = json['status'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     slug = json['slug'];
//     iV = json['__v'];
//     if (json['rating'] != null) {
//       rating = <Rating>[];
//       json['rating'].forEach((v) {
//         rating!.add(new Rating.fromJson(v));
//       });
//     }
//     firstImage = json['firstImage'];
//     totalRating = json['totalRating'];
//     totalReview = json['totalReview'];
//     price = json['price'];
//     postedby = json['postedby'];
//     totalrating = json['totalrating'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['viewCount'] = this.viewCount;
//     // if (this.color != null) {
//     //   data['color'] = this.color!.map((v) => v.toJson()).toList();
//     // }
//     data['_id'] = this.sId;
//     data['title'] = this.title;
//     data['sku'] = this.sku;
//     data['description'] = this.description;
//     data['requiredPrice'] = this.requiredPrice;
//     data['salePrice'] = this.salePrice;
//     data['category'] = this.category;
//     data['brand'] = this.brand;
//     data['quantity'] = this.quantity;
//     data['tags'] = this.tags;
//     data['city'] = this.city;
//     data['isManageStock'] = this.isManageStock;
//     data['stockStatus'] = this.stockStatus;
//     data['stockQuantity'] = this.stockQuantity;
//     data['allowBackOrders'] = this.allowBackOrders;
//     data['lowStockHolder'] = this.lowStockHolder;
//     data['postedBy'] = this.postedBy;
//     data['images'] = this.images;
//     data['status'] = this.status;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['slug'] = this.slug;
//     data['__v'] = this.iV;
//     if (this.rating != null) {
//       data['rating'] = this.rating!.map((v) => v.toJson()).toList();
//     }
//     data['firstImage'] = this.firstImage;
//     data['totalRating'] = this.totalRating;
//     data['totalReview'] = this.totalReview;
//     data['price'] = this.price;
//     data['postedby'] = this.postedby;
//     data['totalrating'] = this.totalrating;
//     return data;
//   }
// }

// class Rating {
//   String? user;
//   int? value;
//   String? message;
//   String? sId;

//   Rating({this.user, this.value, this.message, this.sId});

//   Rating.fromJson(Map<String, dynamic> json) {
//     user = json['user'];
//     value = json['value'];
//     message = json['message'];
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user'] = this.user;
//     data['value'] = this.value;
//     data['message'] = this.message;
//     data['_id'] = this.sId;
//     return data;
//   }
// }

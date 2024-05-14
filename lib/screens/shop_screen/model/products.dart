// import 'package:darkak_e_commerce_app/screens/profile_screen/model/user.dart';
// import 'package:darkak_e_commerce_app/screens/shop_screen/model/model.dart';
// import 'package:darkak_e_commerce_app/screens/shop_screen/model/category.dart';
// import 'package:darkak_e_commerce_app/screens/shop_screen/model/product_group.dart';
// import 'package:darkak_e_commerce_app/screens/shop_screen/model/warranty.dart';
// import 'package:darkak_e_commerce_app/screens/shop_screen/model/sizes.dart';
// import 'package:darkak_e_commerce_app/screens/shop_screen/model/colors.dart';
// import 'package:darkak_e_commerce_app/screens/shop_screen/model/unit.dart';
// import 'package:darkak_e_commerce_app/screens/shop_screen/model/images.dart';
//
// class Products {
//   String? id;
//   String? productType;
//   int? alertQuantity;
//   String? name;
//   Model? model;
//   Category? category;
//   ProductGroup? productGroup;
//   ProductGroup? brand;
//   Warranty? warranty;
//   List<Sizes>? sizes;
//   List<ProductColors>? colors;
//   Unit? unit;
//   List<Images>? images;
//   int? regularPrice;
//   int? offerPrice;
//   int? appPrice;
//   String? shortDesc;
//   String? longDesc;
//   String? metaDesc;
//   String? metaTitleDesc;
//   int? deliveryTime;
//   int? quantity;
//   bool? isActive;
//   int? weight;
//   User? user;
//   String? createdAt;
//   String? udpatedAt;
//
//   Products(
//       {this.id,
//         this.productType,
//         this.alertQuantity,
//         this.name,
//         this.model,
//         this.category,
//         this.productGroup,
//         this.brand,
//         this.warranty,
//         this.sizes,
//         this.colors,
//         this.unit,
//         this.images,
//         this.regularPrice,
//         this.offerPrice,
//         this.appPrice,
//         this.shortDesc,
//         this.longDesc,
//         this.metaDesc,
//         this.metaTitleDesc,
//         this.deliveryTime,
//         this.quantity,
//         this.isActive,
//         this.weight,
//         this.user,
//         this.createdAt,
//         this.udpatedAt});
//
//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productType = json['product_type'];
//     alertQuantity = json['alert_quantity'];
//     name = json['name'];
//     model = json['model'] != null ? Model.fromJson(json['model']) : null;
//     category = json['category'] != null
//         ? Category.fromJson(json['category'])
//         : null;
//     productGroup = json['productGroup'] != null
//         ? ProductGroup.fromJson(json['productGroup'])
//         : null;
//     brand =
//     json['brand'] != null ? ProductGroup.fromJson(json['brand']) : null;
//     warranty = json['warranty'] != null
//         ? Warranty.fromJson(json['warranty'])
//         : null;
//     if (json['sizes'] != null) {
//       sizes = <Sizes>[];
//       json['sizes'].forEach((v) {
//         sizes!.add(Sizes.fromJson(v));
//       });
//     }
//     if (json['colors'] != null) {
//       colors = <ProductColors>[];
//       json['colors'].forEach((v) {
//         colors!.add(ProductColors.fromJson(v));
//       });
//     }
//     unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
//     if (json['images'] != null) {
//       images = <Images>[];
//       json['images'].forEach((v) {
//         images!.add(Images.fromJson(v));
//       });
//     }
//     regularPrice = json['regular_price'];
//     offerPrice = json['offer_price'];
//     appPrice = json['app_price'];
//     shortDesc = json['short_desc'];
//     longDesc = json['long_desc'];
//     metaDesc = json['meta_desc'];
//     metaTitleDesc = json['meta_title_desc'];
//     deliveryTime = json['delivery_time'];
//     quantity = json['quantity'];
//     isActive = json['isActive'];
//     weight = json['weight'];
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//     createdAt = json['createdAt'];
//     udpatedAt = json['udpatedAt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['product_type'] = productType;
//     data['alert_quantity'] = alertQuantity;
//     data['name'] = name;
//     if (model != null) {
//       data['model'] = model!.toJson();
//     }
//     if (category != null) {
//       data['category'] = category!.toJson();
//     }
//     if (productGroup != null) {
//       data['productGroup'] = productGroup!.toJson();
//     }
//     if (brand != null) {
//       data['brand'] = brand!.toJson();
//     }
//     if (warranty != null) {
//       data['warranty'] = warranty!.toJson();
//     }
//     if (sizes != null) {
//       data['sizes'] = sizes!.map((v) => v.toJson()).toList();
//     }
//     if (colors != null) {
//       data['colors'] = colors!.map((v) => v.toJson()).toList();
//     }
//     if (unit != null) {
//       data['unit'] = unit!.toJson();
//     }
//     if (images != null) {
//       data['images'] = images!.map((v) => v.toJson()).toList();
//     }
//     data['regular_price'] = regularPrice;
//     data['offer_price'] = offerPrice;
//     data['app_price'] = appPrice;
//     data['short_desc'] = shortDesc;
//     data['long_desc'] = longDesc;
//     data['meta_desc'] = metaDesc;
//     data['meta_title_desc'] = metaTitleDesc;
//     data['delivery_time'] = deliveryTime;
//     data['quantity'] = quantity;
//     data['isActive'] = isActive;
//     data['weight'] = weight;
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     data['createdAt'] = createdAt;
//     data['udpatedAt'] = udpatedAt;
//     return data;
//   }
// }

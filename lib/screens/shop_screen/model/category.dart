// import 'package:darkak_e_commerce_app/screens/shop_screen/model/images.dart';
// class Category {
//   String? id;
//   Images? image;
//   String? name;
//   String? description;
//   String? productGroup;
//   String? brand;
//   int? commision;
//   bool? isActive;
//
//   Category(
//       {this.id,
//         this.image,
//         this.name,
//         this.description,
//         this.productGroup,
//         this.brand,
//         this.commision,
//         this.isActive});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'] != null ? new Images.fromJson(json['image']) : null;
//     name = json['name'];
//     description = json['description'];
//     productGroup = json['productGroup'];
//     brand = json['brand'];
//     commision = json['commision'];
//     isActive = json['isActive'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     if (image != null) {
//       data['image'] = image!.toJson();
//     }
//     data['name'] = name;
//     data['description'] = description;
//     data['productGroup'] = productGroup;
//     data['brand'] = brand;
//     data['commision'] = commision;
//     data['isActive'] = isActive;
//     return data;
//   }
// }

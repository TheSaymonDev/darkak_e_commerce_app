//
//
// import 'package:darkak_e_commerce_app/screens/shop_screen/model/images.dart';
//
// class Model {
//   String? id;
//   String? name;
//   String? description;
//   String? productGroup;
//   String? brand;
//   String? category;
//   Images? image;
//   bool? isActive;
//
//   Model(
//       {this.id,
//         this.name,
//         this.description,
//         this.productGroup,
//         this.brand,
//         this.category,
//         this.image,
//         this.isActive});
//
//   Model.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     productGroup = json['productGroup'];
//     brand = json['brand'];
//     category = json['category'];
//     image = json['image'] != null ? Images.fromJson(json['image']) : null;
//     isActive = json['isActive'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['description'] = description;
//     data['productGroup'] = productGroup;
//     data['brand'] = brand;
//     data['category'] = category;
//     if (image != null) {
//       data['image'] = image!.toJson();
//     }
//     data['isActive'] = isActive;
//     return data;
//   }
// }

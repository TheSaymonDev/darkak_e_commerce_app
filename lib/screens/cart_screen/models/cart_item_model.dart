import 'package:darkak_e_commerce_app/screens/shop_screen/models/product_model.dart';

class CartItemModel {
  String? id;
  ProductModel? productsData;
  int? quantity;
  String? size;
  String? color;
  String? status;
  String? createdAt;
  String? updatedAt;

  CartItemModel(
      {this.id,
      this.productsData,
      this.quantity,
      this.size,
      this.color,
      this.status,
      this.createdAt,
      this.updatedAt});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productsData = json['products'] != null
        ? ProductModel.fromJson(json['products'])
        : null;
    quantity = json['quantity'];
    size = json['size'];
    color = json['color'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (productsData != null) {
      data['products'] = productsData!.toJson();
    }
    data['quantity'] = quantity;
    data['size'] = size;
    data['color'] = color;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

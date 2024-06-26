import 'package:darkak_e_commerce_app/screens/shop_screen/model/product.dart';

class CartItem {
  String? id;
  Product? products;
  int? quantity;
  String? size;
  String? color;
  String? status;
  String? createdAt;
  String? updatedAt;

  CartItem(
      {this.id,
        this.products,
        this.quantity,
        this.size,
        this.color,
        this.status,
        this.createdAt,
        this.updatedAt});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    products = json['products'] != null
        ? Product.fromJson(json['products'])
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
    if (products != null) {
      data['products'] = products!.toJson();
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

import 'package:darkak_e_commerce_app/screens/shop_screen/model/final_product.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/model/products.dart';

class CartItem {
  String? id;
  Products? products;
  int? quantity;
  String? size;
  String? color;
  String? createdAt;
  String? updatedAt;

  CartItem(
      {this.id,
        this.products,
        required this.quantity,
        this.size,
        this.color,
        this.createdAt,
        this.updatedAt});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    products = json['products'] != null
        ? Products.fromJson(json['products'])
        : null;
    quantity = json['quantity'];
    size = json['size'];
    color = json['color'];
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
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

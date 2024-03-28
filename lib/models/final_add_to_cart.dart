class AddToCart {
  String? productId;
  String? size;
  String? color;
  String? quantity;

  AddToCart({this.productId, this.size, this.color, this.quantity});

  AddToCart.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    size = json['size'];
    color = json['color'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['size'] = size;
    data['color'] = color;
    data['quantity'] = quantity;
    return data;
  }
}

class AddToWishlistModel {
  String productId;

  AddToWishlistModel({required this.productId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    return data;
  }
}

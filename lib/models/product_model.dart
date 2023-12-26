class ProductModel {
  String imgUrl, productName;
  int productPrice, productDiscount;
  double productRating;
  bool isFavourite;

  ProductModel({
    required this.imgUrl,
    required this.productName,
    required this.productPrice,
    required this.productRating,
    required this.isFavourite,
    required this.productDiscount,
  });

  void toggleFavorite() {
    isFavourite = !isFavourite;
  }
}

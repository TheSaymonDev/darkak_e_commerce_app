class BestSellingProductModel {
  String imgUrl, productName;
  int productPrice, productDiscount;
  double productRating;
  bool isFavourite;
  BestSellingProductModel({
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

  static List<BestSellingProductModel> bestSellingProductList = [
    BestSellingProductModel(
        imgUrl: 'assets/images/product-img.png',
        productName: 'Saree',
        productPrice: 500,
        productRating: 4.5,
        productDiscount: 20,
        isFavourite: false),
    BestSellingProductModel(
        imgUrl: 'assets/images/product-img.png',
        productName: 'Saree',
        productPrice: 600,
        productRating: 5.0,
        productDiscount: 10,
        isFavourite: false),
    BestSellingProductModel(
        imgUrl: 'assets/images/product-img.png',
        productName: 'Saree',
        productPrice: 500,
        productRating: 3.5,
        productDiscount: 30,
        isFavourite: false),
    BestSellingProductModel(
        imgUrl: 'assets/images/product-img.png',
        productName: 'Saree',
        productPrice: 600,
        productRating: 5.0,
        productDiscount: 10,
        isFavourite: false),
  ];
}

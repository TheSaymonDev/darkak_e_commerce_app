class CartProductItemModel {
  String productImg, productName, productSize;
  int productPrice, productQuantity, productRating;
  bool isFavourite;
  CartProductItemModel({
    required this.productImg,
    required this.productName,
    required this.productSize,
    required this.productPrice,
    required this.productQuantity,
    required this.productRating,
    required this.isFavourite,
  });

  static List<CartProductItemModel> cartProductItemList = [
    CartProductItemModel(
      productImg: 'assets/images/product-img.png',
      productName: 'Saree',
      productSize: 'L',
      productPrice: 500,
      productQuantity: 1,
      productRating: 5,
      isFavourite: false,
    ),
    CartProductItemModel(
      productImg: 'assets/images/product-img.png',
      productName: 'Saree',
      productSize: 'L',
      productPrice: 500,
      productQuantity: 1,
      productRating: 4,
      isFavourite: false,
    ),
    CartProductItemModel(
      productImg: 'assets/images/product-img.png',
      productName: 'Saree',
      productSize: 'L',
      productPrice: 500,
      productQuantity: 1,
      productRating: 3,
      isFavourite: false,
    ),
  ];
}

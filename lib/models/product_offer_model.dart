class ProductOfferModel{
  String imgUrl;
  ProductOfferModel({required this.imgUrl});
  static List<ProductOfferModel> productOfferList = [
    ProductOfferModel(imgUrl: 'assets/images/offer-img.png'),
    ProductOfferModel(imgUrl: 'assets/images/offer-img.png'),
    ProductOfferModel(imgUrl: 'assets/images/offer-img.png'),
  ];
}
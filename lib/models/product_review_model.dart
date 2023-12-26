class ProductReviewModel {
  String profileImage, name, message;
  double rating;
  bool isLiked;
  List<String>  productImage;
  ProductReviewModel(
      {required this.profileImage,
      required this.name,
      required this.message,
      required this.productImage,
      required this.rating,
      required this.isLiked});

  void toggleHelpful(){
    isLiked =! isLiked;
  }

  static List<ProductReviewModel> productReviewList = [
    ProductReviewModel(
        profileImage: 'assets/images/profile-photo.png',
        name: 'Rony',
        message: 'Wonderful jean, perfect gift for my girl for our anniversary!',
        productImage: ['assets/images/product-img.png', 'assets/images/product-img.png', 'assets/images/product-img.png',],
        rating: 3.5,
        isLiked: false),
    ProductReviewModel(
        profileImage: 'assets/images/profile-photo.png',
        name: 'Rony',
        message: 'Wonderful jean, perfect gift for my girl for our anniversary!',
        productImage: ['assets/images/product-img.png', 'assets/images/product-img.png', 'assets/images/product-img.png',],
        rating: 3.5,
        isLiked: false),
    ProductReviewModel(
        profileImage: 'assets/images/profile-photo.png',
        name: 'Rony',
        message: 'Wonderful jean, perfect gift for my girl for our anniversary!',
        productImage: ['assets/images/product-img.png', 'assets/images/product-img.png', 'assets/images/product-img.png',],
        rating: 3.5,
        isLiked: false),
    ProductReviewModel(
        profileImage: 'assets/images/profile-photo.png',
        name: 'Rony',
        message: 'Wonderful jean, perfect gift for my girl for our anniversary!',
        productImage: ['assets/images/product-img.png', 'assets/images/product-img.png', 'assets/images/product-img.png',],
        rating: 3.5,
        isLiked: false),
  ];
}

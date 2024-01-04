import 'package:darkak_e_commerce_app/models/product_review_model.dart';

class ProductModel {
  String productID; // Unique identifier for the product
  String productImagePath;
  String productName;
  int productPrice;
  int? quantity;
  String? category;
  String productDescription;
  List<String> imagesPath; // List of image URLs
  List<String> color;
  bool? availability;
  List<String> attributes; // Additional attributes for the product
  String? manufacturer;
  List<ProductReviewModel>
      customerReviews; // List of customer reviews and ratings
  double productRating;
  int discounts; // Details about discounts or promotions
  DateTime? dateAdded = DateTime.now(); // Timestamp when the product was added
  DateTime? dateUpdated; // Timestamp when the product was last updated
  bool isFavourite;

  ProductModel(
      {required this.productID,
      required this.productImagePath,
      required this.productName,
      required this.productPrice,
      this.quantity,
      this.category,
      required this.productDescription,
      required this.imagesPath,
      required this.color,
      this.availability,
      required this.attributes,
      this.manufacturer,
      required this.customerReviews,
      required this.productRating,
      required this.discounts,
      this.dateAdded,
      this.dateUpdated,
      this.isFavourite = false});

  // void toggleFavorite() {
  //   // Assuming isFavourite is part of customerReviews, you can toggle it as follows:
  //   for (var review in customerReviews) {
  //     review['isFavourite'] = !(review['isFavourite'] ?? false);
  //   }
  // }

  void toggleFavorite() {
    isFavourite = !isFavourite;
  }

  static List<ProductModel> storeProduct = [
    ProductModel(
        productID: '1',
        productImagePath: 'assets/images/product-img.png',
        productName: 'Saree',
        productPrice: 500,
        productDescription:
            'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.',
        imagesPath: List.generate(4, (index) => 'assets/images/product-img.png'),
        color: ['Red', 'Blue', 'Black', 'Orange'],
        attributes: ['S', 'M', 'L', 'XL', 'XXL'],
        customerReviews: ProductReviewModel.productReviewList,
        discounts: 10,
        productRating: 4.5),
    ProductModel(
        productID: '1',
        productImagePath: 'assets/images/product-img.png',
        productName: 'Saree',
        productPrice: 500,
        productDescription:
        'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.',
        imagesPath: List.generate(4, (index) => 'assets/images/product-img.png'),
        color: ['Red', 'Blue', 'Black', 'Orange'],
        attributes: ['S', 'M', 'L', 'XL', 'XXL', 'XXL'],
        customerReviews: ProductReviewModel.productReviewList,
        discounts: 10,
        productRating: 4.5),
  ];
}

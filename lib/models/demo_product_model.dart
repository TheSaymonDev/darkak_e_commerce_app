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

}

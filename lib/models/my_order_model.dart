import 'package:darkak_e_commerce_app/models/product_model.dart';
import 'package:darkak_e_commerce_app/models/product_review_model.dart';
import 'package:darkak_e_commerce_app/reusable/utility.dart';

class MyOrder {
  final String orderID;
  final DateTime date;
  final List<ProductModel> products;

  MyOrder({
    required this.orderID,
    required this.date,
    required this.products,
  });

  static List<MyOrder> activeOrders = [
    MyOrder(
      orderID: '00001',
      date: DateTime.now(),
      products: multipleProduct,
    ),
    MyOrder(
      orderID: '00002',
      date: DateTime.now(),
      products: singleProduct,
    ),
  ];
  static List<MyOrder> completedOrders = [
    MyOrder(
      orderID: '00003',
      date: DateTime.now(),
      products: singleProduct,
    ),
    MyOrder(
      orderID: '00004',
      date: DateTime.now(),
      products: multipleProduct,
    ),
  ];
  static List<MyOrder> cancelledOrders = [
    MyOrder(
      orderID: '00005',
      date: DateTime.now(),
      products: multipleProduct,
    ),
    MyOrder(
      orderID: '00006',
      date: DateTime.now(),
      products: singleProduct,
    ),
  ];
}


List<ProductModel> singleProduct = [
  ProductModel(
      productID: '1',
      productImagePath: watchImage,
      productName: 'Saree',
      productPrice: 500,
      productDescription:
      'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.',
      imagesPath: List.generate(4, (index) => watchImage),
      color: ['Red', 'Blue', 'Black', 'Orange'],
      attributes: ['S', 'M', 'L', 'XL', 'XXL'],
      customerReviews: ProductReviewModel.productReviewList,
      discounts: 10,
      productRating: 4.5,
    quantity: 1,
  ),
];
List<ProductModel> multipleProduct = [
  ProductModel(
      productID: '1',
      productImagePath: watchImage,
      productName: 'Saree',
      productPrice: 500,
      productDescription:
      'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.',
      imagesPath: List.generate(4, (index) => watchImage),
      color: ['Red', 'Blue', 'Black', 'Orange'],
      attributes: ['S', 'M', 'L', 'XL', 'XXL'],
      customerReviews: ProductReviewModel.productReviewList,
      discounts: 10,
      productRating: 4.5,
    quantity: 3,),
  ProductModel(
      productID: '1',
      productImagePath: watchImage,
      productName: 'Saree',
      productPrice: 500,
      productDescription:
      'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.',
      imagesPath: List.generate(4, (index) => watchImage),
      color: ['Red', 'Blue', 'Black', 'Orange'],
      attributes: ['S', 'M', 'L', 'XL', 'XXL'],
      customerReviews: ProductReviewModel.productReviewList,
      discounts: 10,
      productRating: 4.5,
    quantity: 2,),
];
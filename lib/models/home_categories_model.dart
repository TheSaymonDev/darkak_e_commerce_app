import 'package:e_commerce_app/models/product_model.dart';

List<ProductModel> tShirtProductList = [
  ProductModel(
      imgUrl: 'assets/images/tshirt.png',
      productName: 'T-Shirt',
      productPrice: 500,
      productRating: 4.5,
      productDiscount: 20,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/tshirt.png',
      productName: 'T-Shirt',
      productPrice: 600,
      productRating: 5.0,
      productDiscount: 10,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/tshirt.png',
      productName: 'T-Shirt',
      productPrice: 500,
      productRating: 3.5,
      productDiscount: 30,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/tshirt.png',
      productName: 'T-Shirt',
      productPrice: 600,
      productRating: 5.0,
      productDiscount: 10,
      isFavourite: false),
];

List<ProductModel> pantProductList = [
  ProductModel(
      imgUrl: 'assets/images/pant.png',
      productName: 'Pant',
      productPrice: 500,
      productRating: 4.5,
      productDiscount: 20,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/pant.png',
      productName: 'Pant',
      productPrice: 600,
      productRating: 5.0,
      productDiscount: 10,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/pant.png',
      productName: 'Pant',
      productPrice: 500,
      productRating: 3.5,
      productDiscount: 30,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/pant.png',
      productName: 'Pant',
      productPrice: 600,
      productRating: 5.0,
      productDiscount: 10,
      isFavourite: false),
];

List<ProductModel> sareeProductList = [
  ProductModel(
      imgUrl: 'assets/images/saree.jpg',
      productName: 'Saree',
      productPrice: 500,
      productRating: 4.5,
      productDiscount: 20,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/saree.jpg',
      productName: 'Saree',
      productPrice: 600,
      productRating: 5.0,
      productDiscount: 10,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/saree.jpg',
      productName: 'Saree',
      productPrice: 500,
      productRating: 3.5,
      productDiscount: 30,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/saree.jpg',
      productName: 'Saree',
      productPrice: 600,
      productRating: 5.0,
      productDiscount: 10,
      isFavourite: false),
];

List<ProductModel> cosmeticsProductList = [
  ProductModel(
      imgUrl: 'assets/images/cosmetics.png',
      productName: 'Cosmetics',
      productPrice: 500,
      productRating: 4.5,
      productDiscount: 20,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/cosmetics.png',
      productName: 'Cosmetics',
      productPrice: 600,
      productRating: 5.0,
      productDiscount: 10,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/cosmetics.png',
      productName: 'Cosmetics',
      productPrice: 500,
      productRating: 3.5,
      productDiscount: 30,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/cosmetics.png',
      productName: 'Cosmetics',
      productPrice: 600,
      productRating: 5.0,
      productDiscount: 10,
      isFavourite: false),
];

List<ProductModel> watchProductList = [
  ProductModel(
      imgUrl: 'assets/images/watch.jpg',
      productName: 'Watch',
      productPrice: 500,
      productRating: 4.5,
      productDiscount: 20,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/watch.jpg',
      productName: 'Watch',
      productPrice: 600,
      productRating: 5.0,
      productDiscount: 10,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/watch.jpg',
      productName: 'Watch',
      productPrice: 500,
      productRating: 3.5,
      productDiscount: 30,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/watch.jpg',
      productName: 'Watch',
      productPrice: 600,
      productRating: 5.0,
      productDiscount: 10,
      isFavourite: false),
];

List<ProductModel> bagProductList = [
  ProductModel(
      imgUrl: 'assets/images/bag.jpg',
      productName: 'Bag',
      productPrice: 500,
      productRating: 4.5,
      productDiscount: 20,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/bag.jpg',
      productName: 'Bag',
      productPrice: 600,
      productRating: 5.0,
      productDiscount: 10,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/bag.jpg',
      productName: 'Bag',
      productPrice: 500,
      productRating: 3.5,
      productDiscount: 30,
      isFavourite: false),
  ProductModel(
      imgUrl: 'assets/images/bag.jpg',
      productName: 'Bag',
      productPrice: 600,
      productRating: 5.0,
      productDiscount: 10,
      isFavourite: false),
];

class Category {
  String categoryName, categoryImage;
  List<SubCategory> categoryProductList;

  Category({
    required this.categoryName,
    required this.categoryImage,
    required this.categoryProductList,
  });

  static List<Category> categoryList = [
    Category(
        categoryName: 'Men',
        categoryImage: 'assets/images/c-men.svg',
        categoryProductList: SubCategory.menProductList),
    Category(
        categoryName: 'Women',
        categoryImage: 'assets/images/c-women.svg',
        categoryProductList: SubCategory.womenProductList),
    Category(
        categoryName: 'Devices',
        categoryImage: 'assets/images/c-devices.svg',
        categoryProductList: SubCategory.devicesProductList),
    Category(
        categoryName: 'Gadgets',
        categoryImage: 'assets/images/c-gadgets.svg',
        categoryProductList: SubCategory.gadgetsProductList),
    Category(
        categoryName: 'Gaming',
        categoryImage: 'assets/images/c-gaming.svg',
        categoryProductList: SubCategory.gamingProductList),
  ];
}

class SubCategory {
  String subCategoryName;
  List<ProductModel> subCategoryProductList;

  SubCategory({
    required this.subCategoryName,
    required this.subCategoryProductList,
  });

  static List<SubCategory> menProductList = [
    SubCategory(subCategoryName: 'All', subCategoryProductList: []),
    SubCategory(
        subCategoryName: 'T-Shirt', subCategoryProductList: tShirtProductList),
    SubCategory(
        subCategoryName: 'Pant', subCategoryProductList: pantProductList),
  ];

  static List<SubCategory> womenProductList = [
    SubCategory(subCategoryName: 'All', subCategoryProductList: []),
    SubCategory(
        subCategoryName: 'Saree', subCategoryProductList: sareeProductList),
    SubCategory(
        subCategoryName: 'Cosmetics',
        subCategoryProductList: cosmeticsProductList),
  ];

  static List<SubCategory> devicesProductList = [
    SubCategory(subCategoryName: 'All', subCategoryProductList: []),
    SubCategory(
        subCategoryName: 'Watch', subCategoryProductList: watchProductList),
    SubCategory(
        subCategoryName: 'Bag',
        subCategoryProductList: bagProductList),
  ];

  static List<SubCategory> gadgetsProductList = [
    SubCategory(subCategoryName: 'All', subCategoryProductList: []),
    SubCategory(
        subCategoryName: 'Watch', subCategoryProductList: watchProductList),
    SubCategory(
        subCategoryName: 'Bag',
        subCategoryProductList: bagProductList),
  ];

  static List<SubCategory> gamingProductList = [
    SubCategory(subCategoryName: 'All', subCategoryProductList: []),
    SubCategory(
        subCategoryName: 'Watch', subCategoryProductList: watchProductList),
    SubCategory(
        subCategoryName: 'Bag',
        subCategoryProductList: bagProductList),
  ];
}

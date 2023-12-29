import 'package:e_commerce_app/data/myProduct/bag.dart';
import 'package:e_commerce_app/data/myProduct/borka.dart';
import 'package:e_commerce_app/data/myProduct/hijab.dart';
import 'package:e_commerce_app/data/myProduct/saree.dart';
import 'package:e_commerce_app/data/myProduct/shalwar.dart';
import 'package:e_commerce_app/data/myProduct/watch.dart';
import 'package:e_commerce_app/models/product_model.dart';

class Category {
  String categoriesName, categoriesImageUrl;
  List<CategoryChild> categoryChildList;

  Category({
    required this.categoriesName,
    required this.categoriesImageUrl,
    required this.categoryChildList,
  });

  static List<Category> categoryList = [
    Category(
        categoriesName: "Women's & Girl's Fashion",
        categoriesImageUrl: 'assets/images/c-girls.svg',
        categoryChildList: CategoryChild.womenList),
    Category(
        categoriesName: 'Watches, Bags, Jewellery',
        categoriesImageUrl: 'assets/images/c-watch.svg',
        categoryChildList: CategoryChild.watchList),
  ];
}

class CategoryChild {
  String categoryChildName;
  List<SubCategory> subCategoryList;
  CategoryChild({
    required this.categoryChildName,
    required this.subCategoryList,
  });

  static List<CategoryChild> womenList = [
    CategoryChild(
        categoryChildName: 'Traditional Wear',
        subCategoryList: SubCategory.traditionalWearList),
    CategoryChild(
        categoryChildName: 'Muslim Wear',
        subCategoryList: SubCategory.muslimWearList),
  ];
  static List<CategoryChild> watchList = [
    CategoryChild(
        categoryChildName: 'Watch', subCategoryList: SubCategory.watchesList),
    CategoryChild(
        categoryChildName: 'Bags', subCategoryList: SubCategory.bagsList),
  ];
}

class SubCategory {
  String subCategoryName, subCategoryImageUrl;
  List<ProductModel> productList;
  SubCategory({
    required this.subCategoryName,
    required this.subCategoryImageUrl,
    required this.productList,
  });

  static List<SubCategory> traditionalWearList = [
    SubCategory(
        subCategoryName: 'Saree',
        subCategoryImageUrl: 'assets/images/saree.jpg',
        productList: sareeList),
    SubCategory(
        subCategoryName: 'Shalwar',
        subCategoryImageUrl: 'assets/images/shalwar.jpg',
        productList: shalwarList),
  ];
  static List<SubCategory> muslimWearList = [
    SubCategory(
        subCategoryName: 'Hijab',
        subCategoryImageUrl: 'assets/images/hijab.jpg',
        productList: hijabList),
    SubCategory(
        subCategoryName: 'Borka',
        subCategoryImageUrl: 'assets/images/borka.jpg',
        productList: borkaList),
  ];
  static List<SubCategory> watchesList = [
    SubCategory(
        subCategoryName: 'Casio',
        subCategoryImageUrl: 'assets/images/watch.jpg',
        productList: watchList),
    SubCategory(
        subCategoryName: 'Rolex',
        subCategoryImageUrl: 'assets/images/watch.jpg',
        productList: watchList),
  ];
  static List<SubCategory> bagsList = [
    SubCategory(
        subCategoryName: 'Max',
        subCategoryImageUrl: 'assets/images/bag.jpg',
        productList: bagList),
    SubCategory(
        subCategoryName: 'Cat',
        subCategoryImageUrl: 'assets/images/bag.jpg',
        productList: bagList),
  ];
}

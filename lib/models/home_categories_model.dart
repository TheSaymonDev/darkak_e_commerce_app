import 'package:darkak_e_commerce_app/models/demo_product_list.dart';
import 'package:darkak_e_commerce_app/models/product_model.dart';

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
        subCategoryName: 'T-Shirt', subCategoryProductList: demoProductList),
    SubCategory(
        subCategoryName: 'Pant', subCategoryProductList: demoProductList),
  ];

  static List<SubCategory> womenProductList = [
    SubCategory(subCategoryName: 'All', subCategoryProductList: []),
    SubCategory(
        subCategoryName: 'Saree', subCategoryProductList: demoProductList),
    SubCategory(
        subCategoryName: 'Cosmetics',
        subCategoryProductList: demoProductList),
  ];

  static List<SubCategory> devicesProductList = [
    SubCategory(subCategoryName: 'All', subCategoryProductList: []),
    SubCategory(
        subCategoryName: 'Watch', subCategoryProductList: demoProductList),
    SubCategory(
        subCategoryName: 'Bag',
        subCategoryProductList: demoProductList),
  ];

  static List<SubCategory> gadgetsProductList = [
    SubCategory(subCategoryName: 'All', subCategoryProductList: []),
    SubCategory(
        subCategoryName: 'Watch', subCategoryProductList: demoProductList),
    SubCategory(
        subCategoryName: 'Bag',
        subCategoryProductList: demoProductList),
  ];

  static List<SubCategory> gamingProductList = [
    SubCategory(subCategoryName: 'All', subCategoryProductList: []),
    SubCategory(
        subCategoryName: 'Watch', subCategoryProductList: demoProductList),
    SubCategory(
        subCategoryName: 'Bag',
        subCategoryProductList: demoProductList),
  ];
}

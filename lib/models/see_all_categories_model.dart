import 'package:darkak_e_commerce_app/models/demo_product_list.dart';
import 'package:darkak_e_commerce_app/models/demo_product_model.dart';

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
        categoriesName: 'Health & Beauty',
        categoriesImageUrl: 'assets/images/c-health.svg',
        categoryChildList: CategoryChild.watchList),
    Category(
        categoriesName: 'Watches, Bags, Jewellery',
        categoriesImageUrl: 'assets/images/c-watch.svg',
        categoryChildList: CategoryChild.womenList),
    Category(
        categoriesName: "Men's & Boy's Fashion",
        categoriesImageUrl: 'assets/images/c-mens.svg',
        categoryChildList: CategoryChild.watchList),
    Category(
        categoriesName: 'Mother & Baby',
        categoriesImageUrl: 'assets/images/c-mother.svg',
        categoryChildList: CategoryChild.womenList),
    Category(
        categoriesName: 'Electronics Devices',
        categoriesImageUrl: 'assets/images/c-electronics.svg',
        categoryChildList: CategoryChild.watchList),
    Category(
        categoriesName: 'TV & Home Appliances',
        categoriesImageUrl: 'assets/images/c-tv.svg',
        categoryChildList: CategoryChild.womenList),
    Category(
        categoriesName: 'Electronic Accessories',
        categoriesImageUrl: 'assets/images/c-accessories.svg',
        categoryChildList: CategoryChild.watchList),
    Category(
        categoriesName: 'Groceries',
        categoriesImageUrl: 'assets/images/c-groceries.svg',
        categoryChildList: CategoryChild.womenList),
    Category(
        categoriesName: 'Home & Lifestyle',
        categoriesImageUrl: 'assets/images/c-home.svg',
        categoryChildList: CategoryChild.watchList),
    Category(
        categoriesName: 'Sports & Outdoors',
        categoriesImageUrl: 'assets/images/c-sports.svg',
        categoryChildList: CategoryChild.womenList),
    Category(
        categoriesName: 'Automotive & Motorbike',
        categoriesImageUrl: 'assets/images/c-automotive.svg',
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
        productList: demoProductList),
    SubCategory(
        subCategoryName: 'Shalwar',
        subCategoryImageUrl: 'assets/images/shalwar.jpg',
        productList: demoProductList),
  ];
  static List<SubCategory> muslimWearList = [
    SubCategory(
        subCategoryName: 'Hijab',
        subCategoryImageUrl: 'assets/images/hijab.jpg',
        productList: demoProductList),
    SubCategory(
        subCategoryName: 'Borka',
        subCategoryImageUrl: 'assets/images/borka.jpg',
        productList: demoProductList),
  ];
  static List<SubCategory> watchesList = [
    SubCategory(
        subCategoryName: 'Casio',
        subCategoryImageUrl: 'assets/images/watch.jpg',
        productList: demoProductList),
    SubCategory(
        subCategoryName: 'Rolex',
        subCategoryImageUrl: 'assets/images/watch.jpg',
        productList: demoProductList),
  ];
  static List<SubCategory> bagsList = [
    SubCategory(
        subCategoryName: 'Max',
        subCategoryImageUrl: 'assets/images/bag.jpg',
        productList: demoProductList),
    SubCategory(
        subCategoryName: 'Cat',
        subCategoryImageUrl: 'assets/images/bag.jpg',
        productList: demoProductList),
  ];
}

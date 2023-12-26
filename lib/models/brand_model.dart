class BrandModel{
  String imgUrl, name;
  int totalProducts;
  BrandModel({required this.imgUrl, required this.name, required this.totalProducts});
  static List<BrandModel> brandList = [
    BrandModel(imgUrl: 'assets/images/brand-img.png', name: 'Zara', totalProducts: 1120),
    BrandModel(imgUrl: 'assets/images/brand-img.png', name: 'Zara', totalProducts: 1120),
    BrandModel(imgUrl: 'assets/images/brand-img.png', name: 'Zara', totalProducts: 1120),
    BrandModel(imgUrl: 'assets/images/brand-img.png', name: 'Zara', totalProducts: 1120),
  ];
}
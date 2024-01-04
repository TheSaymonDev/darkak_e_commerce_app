class ProductQuery{
  String title;
  ProductQuery({required this.title});

  static List<ProductQuery> productQueryList = [
    ProductQuery(title: 'All',),
    ProductQuery(title: 'T-Shirt',),
    ProductQuery(title: 'Pant',),
    ProductQuery(title: 'Punjabi',),
    ProductQuery(title: 'Saree',),
    ProductQuery(title: 'Shalwar',),
  ];
}
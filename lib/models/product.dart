class Product {
  String? id;
  String? name;
  FeaturedImage? featuredImage;
  int? regularPrice;
  int? offerPrice;
  bool? isActive;

  Product({
    this.id,
    this.name,
    this.featuredImage,
    this.regularPrice,
    this.offerPrice,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    featuredImage = json['featured_image'] != null
        ? FeaturedImage.fromJson(json['featured_image'])
        : null;
    regularPrice = json['regular_price'];
    offerPrice = json['offer_price'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (featuredImage != null) {
      data['featured_image'] = featuredImage!.toJson();
    }
    data['regular_price'] = regularPrice;
    data['offer_price'] = offerPrice;
    data['isActive'] = isActive;
    return data;
  }
}

class FeaturedImage {
  String? id;
  String? path;

  FeaturedImage({
    this.id,
    this.path,
  });

  FeaturedImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['path'] = path;
    return data;
  }
}

class Category {
  String? id;
  String? name;
  String? description;
  String? productGroup;
  String? brand;
  int? commision;
  bool? isActive;

  Category(
      {this.id,
        this.name,
        this.description,
        this.productGroup,
        this.brand,
        this.commision,
        this.isActive});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    productGroup = json['productGroup'];
    brand = json['brand'];
    commision = json['commision'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['productGroup'] = productGroup;
    data['brand'] = brand;
    data['commision'] = commision;
    data['isActive'] = isActive;
    return data;
  }
}
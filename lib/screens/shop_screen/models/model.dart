class Model {
  String? id;
  String? name;
  String? description;
  String? productGroup;
  String? brand;
  String? category;
  bool? isActive;

  Model(
      {this.id,
        this.name,
        this.description,
        this.productGroup,
        this.brand,
        this.category,
        this.isActive});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    productGroup = json['productGroup'];
    brand = json['brand'];
    category = json['category'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['productGroup'] = productGroup;
    data['brand'] = brand;
    data['category'] = category;
    data['isActive'] = isActive;
    return data;
  }
}
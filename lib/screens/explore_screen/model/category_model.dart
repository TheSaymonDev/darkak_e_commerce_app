class CategoryModel {
  String? id;
  Image? image;
  String? name;
  String? description;
  String? productGroup;
  String? brand;
  bool? isActive;

  CategoryModel(
      {this.id,
        this.image,
        this.name,
        this.description,
        this.productGroup,
        this.brand,
        this.isActive});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    name = json['name'];
    description = json['description'];
    productGroup = json['productGroup'];
    brand = json['brand'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['name'] = name;
    data['description'] = description;
    data['productGroup'] = productGroup;
    data['brand'] = brand;
    data['isActive'] = isActive;
    return data;
  }
}

class Image {
  String? id;
  String? filename;
  String? originalname;
  String? path;
  String? destination;
  String? mimetype;
  int? size;

  Image(
      {this.id,
        this.filename,
        this.originalname,
        this.path,
        this.destination,
        this.mimetype,
        this.size});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filename = json['filename'];
    originalname = json['originalname'];
    path = json['path'];
    destination = json['destination'];
    mimetype = json['mimetype'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filename'] = filename;
    data['originalname'] = originalname;
    data['path'] = path;
    data['destination'] = destination;
    data['mimetype'] = mimetype;
    data['size'] = size;
    return data;
  }
}

class Products {
  String? id;
  String? productType;
  int? alertQuantity;
  String? name;
  FeaturedImage? featuredImage;
  Model? model;
  Category? category;
  ProductGroup? productGroup;
  ProductGroup? brand;
  Warranty? warranty;
  ProductGroup? size;
  ProductGroup? color;
  Unit? unit;
  List<Images>? images;
  int? regularPrice;
  int? offerPrice;
  int? appPrice;
  String? shortDesc;
  String? longDesc;
  String? metaDesc;
  String? metaTitleDesc;
  int? deliveryTime;
  int? quantity;
  bool? isActive;
  String? createdAt;
  String? udpatedAt;

  Products(
      {this.id,
        this.productType,
        this.alertQuantity,
        this.name,
        this.featuredImage,
        this.model,
        this.category,
        this.productGroup,
        this.brand,
        this.warranty,
        this.size,
        this.color,
        this.unit,
        this.images,
        this.regularPrice,
        this.offerPrice,
        this.appPrice,
        this.shortDesc,
        this.longDesc,
        this.metaDesc,
        this.metaTitleDesc,
        this.deliveryTime,
        this.quantity,
        this.isActive,
        this.createdAt,
        this.udpatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    alertQuantity = json['alert_quantity'];
    name = json['name'];
    featuredImage = json['featured_image'] != null
        ? FeaturedImage.fromJson(json['featured_image'])
        : null;
    model = json['model'] != null ? Model.fromJson(json['model']) : null;
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    productGroup = json['productGroup'] != null
        ? ProductGroup.fromJson(json['productGroup'])
        : null;
    brand =
    json['brand'] != null ? ProductGroup.fromJson(json['brand']) : null;
    warranty = json['warranty'] != null
        ? Warranty.fromJson(json['warranty'])
        : null;
    size =
    json['size'] != null ? ProductGroup.fromJson(json['size']) : null;
    color =
    json['color'] != null ? ProductGroup.fromJson(json['color']) : null;
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    regularPrice = json['regular_price'];
    offerPrice = json['offer_price'];
    appPrice = json['app_price'];
    shortDesc = json['short_desc'];
    longDesc = json['long_desc'];
    metaDesc = json['meta_desc'];
    metaTitleDesc = json['meta_title_desc'];
    deliveryTime = json['delivery_time'];
    quantity = json['quantity'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    udpatedAt = json['udpatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = productType;
    data['alert_quantity'] = alertQuantity;
    data['name'] = name;
    if (featuredImage != null) {
      data['featured_image'] = featuredImage!.toJson();
    }
    if (model != null) {
      data['model'] = model!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (productGroup != null) {
      data['productGroup'] = productGroup!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (warranty != null) {
      data['warranty'] = warranty!.toJson();
    }
    if (size != null) {
      data['size'] = size!.toJson();
    }
    if (color != null) {
      data['color'] = color!.toJson();
    }
    if (unit != null) {
      data['unit'] = unit!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['regular_price'] = regularPrice;
    data['offer_price'] = offerPrice;
    data['app_price'] = appPrice;
    data['short_desc'] = shortDesc;
    data['long_desc'] = longDesc;
    data['meta_desc'] = metaDesc;
    data['meta_title_desc'] = metaTitleDesc;
    data['delivery_time'] = deliveryTime;
    data['quantity'] = quantity;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['udpatedAt'] = udpatedAt;
    return data;
  }
}

class FeaturedImage {
  String? id;
  String? filename;
  String? originalname;
  String? path;
  String? destination;
  String? mimetype;
  int? size;

  FeaturedImage(
      {this.id,
        this.filename,
        this.originalname,
        this.path,
        this.destination,
        this.mimetype,
        this.size});

  FeaturedImage.fromJson(Map<String, dynamic> json) {
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

class Category {
  String? id;
  String? name;
  String? description;
  String? productGroup;
  String? brand;
  bool? isActive;

  Category(
      {this.id,
        this.name,
        this.description,
        this.productGroup,
        this.brand,
        this.isActive});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    productGroup = json['productGroup'];
    brand = json['brand'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['productGroup'] = productGroup;
    data['brand'] = brand;
    data['isActive'] = isActive;
    return data;
  }
}

class ProductGroup {
  String? id;
  String? name;
  String? description;
  bool? isActive;

  ProductGroup({this.id, this.name, this.description, this.isActive});

  ProductGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['isActive'] = isActive;
    return data;
  }
}

class Warranty {
  String? id;
  String? name;
  String? duration;
  String? description;
  bool? isActive;

  Warranty(
      {this.id, this.name, this.duration, this.description, this.isActive});

  Warranty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    description = json['description'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['duration'] = duration;
    data['description'] = description;
    data['isActive'] = isActive;
    return data;
  }
}

class Unit {
  String? id;
  String? name;
  String? shortName;
  String? description;
  bool? isActive;

  Unit({this.id, this.name, this.shortName, this.description, this.isActive});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
    description = json['description'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['shortName'] = shortName;
    data['description'] = description;
    data['isActive'] = isActive;
    return data;
  }
}

class Images {
  String? id;
  String? filename;
  String? originalname;
  String? path;
  String? destination;
  String? mimetype;
  int? size;

  Images(
      {this.id,
        this.filename,
        this.originalname,
        this.path,
        this.destination,
        this.mimetype,
        this.size});

  Images.fromJson(Map<String, dynamic> json) {
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



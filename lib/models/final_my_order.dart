import 'package:darkak_e_commerce_app/models/final_user.dart';

class MyOrder {
  String? id;
  List<Carts>? carts;
  User? user;
  String? reason;
  String? discount;
  bool? couponApplied;
  String? couponCode;
  String? address;
  String? note;
  String? delivery;
  Payment? payment;
  String? status;
  String? orderId;
  String? createdAt;
  String? updatedAt;

  MyOrder(
      {this.id,
        this.carts,
        this.user,
        this.reason,
        this.discount,
        this.couponApplied,
        this.couponCode,
        this.address,
        this.note,
        this.delivery,
        this.payment,
        this.status,
        this.orderId,
        this.createdAt,
        this.updatedAt});

  MyOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['carts'] != null) {
      carts = <Carts>[];
      json['carts'].forEach((v) {
        carts!.add(Carts.fromJson(v));
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    reason = json['reason'];
    discount = json['discount'];
    couponApplied = json['couponApplied'];
    couponCode = json['couponCode'];
    address = json['address'];
    note = json['note'];
    delivery = json['delivery'];
    payment =
    json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    status = json['status'];
    orderId = json['orderId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (carts != null) {
      data['carts'] = carts!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['reason'] = reason;
    data['discount'] = discount;
    data['couponApplied'] = couponApplied;
    data['couponCode'] = couponCode;
    data['address'] = address;
    data['note'] = note;
    data['delivery'] = delivery;
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    data['status'] = status;
    data['orderId'] = orderId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Carts {
  String? id;
  Products? products;
  int? quantity;
  String? size;
  String? color;
  String? status;
  String? createdAt;
  String? updatedAt;

  Carts(
      {this.id,
        this.products,
        this.quantity,
        this.size,
        this.color,
        this.status,
        this.createdAt,
        this.updatedAt});

  Carts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    products = json['products'] != null
        ? Products.fromJson(json['products'])
        : null;
    quantity = json['quantity'];
    size = json['size'];
    color = json['color'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (products != null) {
      data['products'] = products!.toJson();
    }
    data['quantity'] = quantity;
    data['size'] = size;
    data['color'] = color;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Products {
  String? id;
  String? productType;
  int? alertQuantity;
  String? name;
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
  User? user;
  String? createdAt;
  String? udpatedAt;

  Products(
      {this.id,
        this.productType,
        this.alertQuantity,
        this.name,
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
        this.user,
        this.createdAt,
        this.udpatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    alertQuantity = json['alert_quantity'];
    name = json['name'];
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    createdAt = json['createdAt'];
    udpatedAt = json['udpatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = productType;
    data['alert_quantity'] = alertQuantity;
    data['name'] = name;
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
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['createdAt'] = createdAt;
    data['udpatedAt'] = udpatedAt;
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

class Payment {
  String? id;
  String? paymentMethod;
  String? paymentStatus;
  int? amount;
  String? createdAt;
  String? updatedAt;

  Payment(
      {this.id,
        this.paymentMethod,
        this.paymentStatus,
        this.amount,
        this.createdAt,
        this.updatedAt});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentMethod = json['paymentMethod'];
    paymentStatus = json['paymentStatus'];
    amount = json['amount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['paymentMethod'] = paymentMethod;
    data['paymentStatus'] = paymentStatus;
    data['amount'] = amount;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

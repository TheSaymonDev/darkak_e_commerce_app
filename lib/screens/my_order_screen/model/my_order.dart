import 'package:darkak_e_commerce_app/screens/cart_screen/model/final_cart_item.dart';
import 'package:darkak_e_commerce_app/screens/profile_screen/model/user.dart';

class MyOrder {
  String? id;
  CartItem? cartItem;
  User? user;
  String? reason;
  String? discount;
  bool? couponApplied;
  String? couponCode;
  Address? address;
  String? note;
  String? delivery;
  Payment? payment;
  String? status;
  String? orderId;
  String? ecrId;
  String? packageCode;
  String? type;
  String? cancellationReason;
  String? cancelledBy;
  String? createdAt;
  String? updatedAt;

  MyOrder(
      {this.id,
        this.cartItem,
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
        this.ecrId,
        this.packageCode,
        this.type,
        this.cancellationReason,
        this.cancelledBy,
        this.createdAt,
        this.updatedAt});

  MyOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartItem = json['cartItem'] != null
        ? CartItem.fromJson(json['cartItem'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    reason = json['reason'];
    discount = json['discount'];
    couponApplied = json['couponApplied'];
    couponCode = json['couponCode'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    note = json['note'];
    delivery = json['delivery'];
    payment =
    json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    status = json['status'];
    orderId = json['orderId'];
    ecrId = json['ecrId'];
    packageCode = json['package_code'];
    type = json['type'];
    cancellationReason = json['cancellationReason'];
    cancelledBy = json['cancelledBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (cartItem != null) {
      data['cartItem'] = cartItem!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['reason'] = reason;
    data['discount'] = discount;
    data['couponApplied'] = couponApplied;
    data['couponCode'] = couponCode;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['note'] = note;
    data['delivery'] = delivery;
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    data['status'] = status;
    data['orderId'] = orderId;
    data['ecrId'] = ecrId;
    data['package_code'] = packageCode;
    data['type'] = type;
    data['cancellationReason'] = cancellationReason;
    data['cancelledBy'] = cancelledBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
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

class Address {
  String? id;
  String? type;
  String? country;
  String? fullName;
  String? mobile;
  String? state;
  bool? billingAddress;
  bool? shippingAddress;
  String? zip;
  String? district;
  String? city;
  String? thana;
  String? area;
  String? address;
  String? landmark;
  String? createdAt;
  String? updatedAt;

  Address(
      {this.id,
        this.type,
        this.country,
        this.fullName,
        this.mobile,
        this.state,
        this.billingAddress,
        this.shippingAddress,
        this.zip,
        this.district,
        this.city,
        this.thana,
        this.area,
        this.address,
        this.landmark,
        this.createdAt,
        this.updatedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    country = json['country'];
    fullName = json['full_name'];
    mobile = json['mobile'];
    state = json['state'];
    billingAddress = json['billingAddress'];
    shippingAddress = json['shippingAddress'];
    zip = json['zip'];
    district = json['district'];
    city = json['city'];
    thana = json['thana'];
    area = json['area'];
    address = json['address'];
    landmark = json['landmark'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['country'] = country;
    data['full_name'] = fullName;
    data['mobile'] = mobile;
    data['state'] = state;
    data['billingAddress'] = billingAddress;
    data['shippingAddress'] = shippingAddress;
    data['zip'] = zip;
    data['district'] = district;
    data['city'] = city;
    data['thana'] = thana;
    data['area'] = area;
    data['address'] = address;
    data['landmark'] = landmark;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Payment {
  String? id;
  String? paymentMethod;
  String? paymentStatus;
  int? totalAmount;
  int? totalAmountWithoutShippingCharge;
  int? totalAmountAfterDiscount;
  int? totalAmountAfterCommission;
  int? shippingCharge;
  int? discount;
  int? commission;
  String? createdAt;
  String? updatedAt;

  Payment(
      {this.id,
        this.paymentMethod,
        this.paymentStatus,
        this.totalAmount,
        this.totalAmountWithoutShippingCharge,
        this.totalAmountAfterDiscount,
        this.totalAmountAfterCommission,
        this.shippingCharge,
        this.discount,
        this.commission,
        this.createdAt,
        this.updatedAt});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentMethod = json['paymentMethod'];
    paymentStatus = json['paymentStatus'];
    totalAmount = json['totalAmount'];
    totalAmountWithoutShippingCharge = json['totalAmountWithoutShippingCharge'];
    totalAmountAfterDiscount = json['totalAmountAfterDiscount'];
    totalAmountAfterCommission = json['totalAmountAfterCommission'];
    shippingCharge = json['shippingCharge'];
    discount = json['discount'];
    commission = json['commission'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['paymentMethod'] = paymentMethod;
    data['paymentStatus'] = paymentStatus;
    data['totalAmount'] = totalAmount;
    data['totalAmountWithoutShippingCharge'] =
        totalAmountWithoutShippingCharge;
    data['totalAmountAfterDiscount'] = totalAmountAfterDiscount;
    data['totalAmountAfterCommission'] = totalAmountAfterCommission;
    data['shippingCharge'] = shippingCharge;
    data['discount'] = discount;
    data['commission'] = commission;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

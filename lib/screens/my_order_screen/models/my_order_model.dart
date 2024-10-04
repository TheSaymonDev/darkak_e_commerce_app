import 'package:darkak_e_commerce_app/screens/address_view_screen/models/address_model.dart';
import 'package:darkak_e_commerce_app/screens/cart_screen/models/cart_item_model.dart';
import 'package:darkak_e_commerce_app/screens/profile_screen/models/user_model.dart';

class MyOrderModel {
  String? id;
  CartItemModel? cartItem;
  UserModel? user;
  String? reason;
  String? discount;
  bool? couponApplied;
  String? couponCode;
  AddressModel? address;
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

  MyOrderModel(
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

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartItem = json['cartItem'] != null
        ? CartItemModel.fromJson(json['cartItem'])
        : null;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    reason = json['reason'];
    discount = json['discount'];
    couponApplied = json['couponApplied'];
    couponCode = json['couponCode'];
    address =
    json['address'] != null ? AddressModel.fromJson(json['address']) : null;
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

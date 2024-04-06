import 'package:darkak_e_commerce_app/models/final_cart_item.dart';

class MyOrder {
  String? id;
  List<CartItem>? carts;
  String? reason;
  String? discount;
  bool? couponApplied;
  String? couponCode;
  String? note;
  String? delivery;
  Payment? payment;
  String? status;
  String? orderId;
  String? ecrId;
  String? cancellationReason;
  String? cancelledBy;
  String? createdAt;
  String? updatedAt;

  MyOrder(
      {this.id,
        this.carts,
        this.reason,
        this.discount,
        this.couponApplied,
        this.couponCode,
        this.note,
        this.delivery,
        this.payment,
        this.status,
        this.orderId,
        this.ecrId,
        this.cancellationReason,
        this.cancelledBy,
        this.createdAt,
        this.updatedAt});

  MyOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['carts'] != null) {
      carts = <CartItem>[];
      json['carts'].forEach((v) {
        carts!.add(CartItem.fromJson(v));
      });
    }
    reason = json['reason'];
    discount = json['discount'];
    couponApplied = json['couponApplied'];
    couponCode = json['couponCode'];
    note = json['note'];
    delivery = json['delivery'];
    payment =
    json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    status = json['status'];
    orderId = json['orderId'];
    ecrId = json['ecrId'];
    cancellationReason = json['cancellationReason'];
    cancelledBy = json['cancelledBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (carts != null) {
      data['carts'] = carts!.map((v) => v.toJson()).toList();
    }
    data['reason'] = reason;
    data['discount'] = discount;
    data['couponApplied'] = couponApplied;
    data['couponCode'] = couponCode;
    data['note'] = note;
    data['delivery'] = delivery;
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    data['status'] = status;
    data['orderId'] = orderId;
    data['ecrId'] = ecrId;
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

class OrderModel {
  List<String>? carts;
  String? address;
  int? amount;
  String? paymentMethod;
  String? delivery;
  String? note;

  OrderModel(
      {this.carts,
        this.address,
        this.amount,
        this.paymentMethod,
        this.delivery,
        this.note});

  OrderModel.fromJson(Map<String, dynamic> json) {
    carts = json['carts'].cast<String>();
    address = json['address'];
    amount = json['amount'];
    paymentMethod = json['paymentMethod'];
    delivery = json['delivery'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carts'] = carts;
    data['address'] = address;
    data['amount'] = amount;
    data['paymentMethod'] = paymentMethod;
    data['delivery'] = delivery;
    data['note'] = note;
    return data;
  }
}

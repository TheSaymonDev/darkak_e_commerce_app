class CreateOrderModel {
  List<String>? carts;
  String? address;
  int? amount;
  String? paymentMethod;
  String? delivery;
  String? note;
  List<String>? packageCode;

  CreateOrderModel(
      {this.carts,
        this.address,
        this.amount,
        this.paymentMethod,
        this.delivery,
        this.note,
        this.packageCode});

  CreateOrderModel.fromJson(Map<String, dynamic> json) {
    carts = json['carts'].cast<String>();
    address = json['address'];
    amount = json['amount'];
    paymentMethod = json['paymentMethod'];
    delivery = json['delivery'];
    note = json['note'];
    packageCode = json['package_code'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carts'] = carts;
    data['address'] = address;
    data['amount'] = amount;
    data['paymentMethod'] = paymentMethod;
    data['delivery'] = delivery;
    data['note'] = note;
    data['package_code'] = packageCode;
    return data;
  }
}

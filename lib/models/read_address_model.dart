class ReadAddressModel {
  String? id;
  String? type;
  String? fullName;
  String? mobile;
  String? state;
  bool? billingAddress;
  bool? shippingAddress;
  String? zip;
  String? city;
  String? thana;
  String? area;
  String? address;
  String? createdAt;
  String? updatedAt;

  ReadAddressModel(
      {this.id,
        this.type,
        this.fullName,
        this.mobile,
        this.state,
        this.billingAddress,
        this.shippingAddress,
        this.zip,
        this.city,
        this.thana,
        this.area,
        this.address,
        this.createdAt,
        this.updatedAt});

  ReadAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    fullName = json['full_name'];
    mobile = json['mobile'];
    state = json['state'];
    billingAddress = json['billingAddress'];
    shippingAddress = json['shippingAddress'];
    zip = json['zip'];
    city = json['city'];
    thana = json['thana'];
    area = json['area'];
    address = json['address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['full_name'] = fullName;
    data['mobile'] = mobile;
    data['state'] = state;
    data['billingAddress'] = billingAddress;
    data['shippingAddress'] = shippingAddress;
    data['zip'] = zip;
    data['city'] = city;
    data['thana'] = thana;
    data['area'] = area;
    data['address'] = address;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

}

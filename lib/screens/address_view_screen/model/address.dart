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
class CreateAddressModel {
  String? address;
  String? area;
  String? city;
  String? state;
  String? mobile;
  String? fullName;
  String? zip;
  String? thana;
  bool? shippingAddress;

  CreateAddressModel(
      {this.address,
        this.area,
        this.city,
        this.state,
        this.mobile,
        this.fullName,
        this.zip,
        this.thana,
        this.shippingAddress});

  CreateAddressModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    area = json['area'];
    city = json['city'];
    state = json['state'];
    mobile = json['mobile'];
    fullName = json['full_name'];
    zip = json['zip'];
    thana = json['thana'];
    shippingAddress = json['shippingAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['area'] = area;
    data['city'] = city;
    data['state'] = state;
    data['mobile'] = mobile;
    data['full_name'] = fullName;
    data['zip'] = zip;
    data['thana'] = thana;
    data['shippingAddress'] = shippingAddress;
    return data;
  }
}

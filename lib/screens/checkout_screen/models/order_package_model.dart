class OrderPackageModel {
  int? id;
  String? packageName;
  String? packageCode;
  int? shippingCharge;
  int? hour;
  String? weight;
  String? weightrange;
  String? deliveryTime;
  String? coverageId;
  String? packageType;
  String? startTime;
  String? endTime;
  String? coverage;
  bool? status;
  String? packageCategory;

  OrderPackageModel(
      {this.id,
        this.packageName,
        this.packageCode,
        this.shippingCharge,
        this.hour,
        this.weight,
        this.weightrange,
        this.deliveryTime,
        this.coverageId,
        this.packageType,
        this.startTime,
        this.endTime,
        this.coverage,
        this.status,
        this.packageCategory});

  OrderPackageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageName = json['package_name'];
    packageCode = json['package_code'];
    shippingCharge = json['shipping_charge'];
    hour = json['hour'];
    weight = json['weight'];
    weightrange = json['weightrange'];
    deliveryTime = json['delivery_time'];
    coverageId = json['coverage_id'];
    packageType = json['package_type'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    coverage = json['coverage'];
    status = json['status'];
    packageCategory = json['package_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['package_name'] = packageName;
    data['package_code'] = packageCode;
    data['shipping_charge'] = shippingCharge;
    data['hour'] = hour;
    data['weight'] = weight;
    data['weightrange'] = weightrange;
    data['delivery_time'] = deliveryTime;
    data['coverage_id'] = coverageId;
    data['package_type'] = packageType;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['coverage'] = coverage;
    data['status'] = status;
    data['package_category'] = packageCategory;
    return data;
  }
}

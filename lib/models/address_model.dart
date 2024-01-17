class AddressModel {
  String addressLine1;
  String addressLine2;
  String division;
  String district;
  String subDistrict;
  String zipCode;
  bool isDefault;

  AddressModel({
    required this.addressLine1,
    required this.addressLine2,
    required this.division,
    required this.district,
    required this.subDistrict,
    required this.zipCode,
    this.isDefault=false,
  });

  static List<AddressModel> addressList = [
    AddressModel(
      addressLine1: 'addressLine1',
      addressLine2: 'addressLine2',
      division: 'division',
      district: 'district',
      subDistrict: 'subDistrict',
      zipCode: 'zipCode',
      isDefault: false
    ),
    AddressModel(
      addressLine1: 'addressLine1',
      addressLine2: 'addressLine2',
      division: 'division',
      district: 'district',
      subDistrict: 'subDistrict',
      zipCode: 'zipCode',
      isDefault: false
    ),
  ];

  static void addAddress(AddressModel newAddress){
    addressList.add(newAddress);
  }
  void toggleDefault(){
    isDefault = !isDefault;
  }
}

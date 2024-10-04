class ProfileUpdateModel {
  String name;
  String dob;
  String marriageDate;

  ProfileUpdateModel({required this.name, required this.dob, required this.marriageDate});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['dob'] = dob;
    data['marriageDate'] = marriageDate;
    return data;
  }
}

import 'dart:io';

class User {
  File? image;
  String name;
  String dob;
  String marriageDate;

  User({required this.image, required this.name, required this.dob, required this.marriageDate});

  User.fromJson(Map<String, dynamic> json, this.image, this.name, this.dob, this.marriageDate) {
    image = json['image'];
    name = json['name'];
    dob = json['dob'];
    marriageDate = json['marriageDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['dob'] = dob;
    data['marriageDate'] = marriageDate;
    return data;
  }
}
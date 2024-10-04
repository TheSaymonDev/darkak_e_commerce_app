class SignUpModel {
  String email;
  String mobile;
  String name;
  String password;

  SignUpModel({required this.email, required this.mobile, required this.name, required this.password});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['mobile'] = mobile;
    data['name'] = name;
    data['password'] = password;
    return data;
  }
}

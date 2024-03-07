class SignUp {
  String email;
  String mobile;
  String name;
  String password;

  SignUp({required this.email, required this.mobile, required this.name, required this.password});

  SignUp.fromJson(Map<String, dynamic> json, this.email, this.mobile, this.name, this.password) {
    email = json['email'];
    mobile = json['mobile'];
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['mobile'] = mobile;
    data['name'] = name;
    data['password'] = password;
    return data;
  }
}

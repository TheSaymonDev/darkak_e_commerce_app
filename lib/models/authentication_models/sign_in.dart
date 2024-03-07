class SignIn {
  String identity;
  String password;

  SignIn({required this.identity, required this.password});

  SignIn.fromJson(Map<String, dynamic> json, this.identity, this.password) {
    identity = json['identity'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identity'] = identity;
    data['password'] = password;
    return data;
  }
}

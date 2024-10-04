class SignInModel {
  String identity;
  String password;

  SignInModel({required this.identity, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identity'] = identity;
    data['password'] = password;
    return data;
  }
}
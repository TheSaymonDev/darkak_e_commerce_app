class SetPasswordModel {
  String userId;
  String password;
  String otp;

  SetPasswordModel({required this.userId, required this.password, required this.otp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['password'] = password;
    data['otp'] = otp;
    return data;
  }
}

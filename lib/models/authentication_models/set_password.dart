class SetPassword {
  String userId;
  String password;
  String otp;

  SetPassword({required this.userId, required this.password, required this.otp});

  SetPassword.fromJson(Map<String, dynamic> json, this.userId, this.password, this.otp) {
    userId = json['userId'];
    password = json['password'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['password'] = password;
    data['otp'] = otp;
    return data;
  }
}

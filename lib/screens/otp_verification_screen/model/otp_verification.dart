class OtpVerification {
  String userId;
  String otp;

  OtpVerification({required this.userId, required this.otp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['otp'] = otp;
    return data;
  }

}

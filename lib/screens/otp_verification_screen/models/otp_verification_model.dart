class OtpVerificationModel {
  String userId;
  String otp;

  OtpVerificationModel({required this.userId, required this.otp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['otp'] = otp;
    return data;
  }

}

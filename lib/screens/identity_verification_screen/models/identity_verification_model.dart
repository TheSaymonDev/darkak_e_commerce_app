class IdentityVerificationModel {
  String identity;

  IdentityVerificationModel({required this.identity});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identity'] = identity;
    return data;
  }
}

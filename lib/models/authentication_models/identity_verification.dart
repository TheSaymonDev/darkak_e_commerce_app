class IdentityVerification {
  String identity;

  IdentityVerification({required this.identity});

  IdentityVerification.fromJson(Map<String, dynamic> json, this.identity) {
    identity = json['identity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identity'] = identity;
    return data;
  }
}

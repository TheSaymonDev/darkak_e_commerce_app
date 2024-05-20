class Seller {
  String? id;
  String? name;
  String? mobile;
  String? role;
  String? alterNativeName;
  String? alterNativeNumber;
  String? maritalStatus;
  String? shopName;
  String? email;
  String? provider;
  bool? isVerified;
  String? verificationToken;
  String? password;
  String? dob;
  String? marriageDate;
  String? passwordResetOtp;
  bool? approved;
  bool? isDarkakVerified;
  String? gender;
  String? createdAt;
  String? updatedAt;
  int? epId;
  String? pickHub;

  Seller(
      {this.id,
        this.name,
        this.mobile,
        this.role,
        this.alterNativeName,
        this.alterNativeNumber,
        this.maritalStatus,
        this.shopName,
        this.email,
        this.provider,
        this.isVerified,
        this.verificationToken,
        this.password,
        this.dob,
        this.marriageDate,
        this.passwordResetOtp,
        this.approved,
        this.isDarkakVerified,
        this.gender,
        this.createdAt,
        this.updatedAt,
        this.epId,
        this.pickHub});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    role = json['role'];
    alterNativeName = json['alterNativeName'];
    alterNativeNumber = json['alterNativeNumber'];
    maritalStatus = json['maritalStatus'];
    shopName = json['shopName'];
    email = json['email'];
    provider = json['provider'];
    isVerified = json['isVerified'];
    verificationToken = json['verificationToken'];
    password = json['password'];
    dob = json['dob'];
    marriageDate = json['marriageDate'];
    passwordResetOtp = json['passwordResetOtp'];
    approved = json['approved'];
    isDarkakVerified = json['isDarkakVerified'];
    gender = json['gender'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    epId = json['ep_id'];
    pickHub = json['pick_hub'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['role'] = this.role;
    data['alterNativeName'] = this.alterNativeName;
    data['alterNativeNumber'] = this.alterNativeNumber;
    data['maritalStatus'] = this.maritalStatus;
    data['shopName'] = this.shopName;
    data['email'] = this.email;
    data['provider'] = this.provider;
    data['isVerified'] = this.isVerified;
    data['verificationToken'] = this.verificationToken;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['marriageDate'] = this.marriageDate;
    data['passwordResetOtp'] = this.passwordResetOtp;
    data['approved'] = this.approved;
    data['isDarkakVerified'] = this.isDarkakVerified;
    data['gender'] = this.gender;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['ep_id'] = this.epId;
    data['pick_hub'] = this.pickHub;
    return data;
  }
}
import 'package:darkak_e_commerce_app/screens/address_view_screen/model/shipping_address.dart';

class User {
  String? id;
  String? name;
  String? mobile;
  String? role;
  ShippingAddress? shippingAddress;
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
  ProfileImage? profileImage;
  String? accessController;
  String? passwordResetOtp;
  bool? approved;
  bool? isDarkakVerified;
  String? paymentDetails;
  String? gender;
  String? createdAt;
  String? updatedAt;
  String? warehouseAddress;
  String? returnAddress;
  String? business;
  String? epId;
  String? pickHub;

  User(
      {this.id,
        this.name,
        this.mobile,
        this.role,
        this.shippingAddress,
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
        this.profileImage,
        this.accessController,
        this.passwordResetOtp,
        this.approved,
        this.isDarkakVerified,
        this.paymentDetails,
        this.gender,
        this.createdAt,
        this.updatedAt,
        this.warehouseAddress,
        this.returnAddress,
        this.business,
        this.epId,
        this.pickHub});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    role = json['role'];
    shippingAddress = json['shippingAddress'] != null
        ? ShippingAddress.fromJson(json['shippingAddress'])
        : null;
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
    profileImage = json['profileImage'] != null
        ? ProfileImage.fromJson(json['profileImage'])
        : null;
    accessController = json['accessController'];
    passwordResetOtp = json['passwordResetOtp'];
    approved = json['approved'];
    isDarkakVerified = json['isDarkakVerified'];
    paymentDetails = json['paymentDetails'];
    gender = json['gender'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    warehouseAddress = json['warehouseAddress'];
    returnAddress = json['returnAddress'];
    business = json['business'];
    epId = json['ep_id'];
    pickHub = json['pick_hub'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['role'] = role;
    if (shippingAddress != null) {
      data['shippingAddress'] = shippingAddress!.toJson();
    }
    data['alterNativeName'] = alterNativeName;
    data['alterNativeNumber'] = alterNativeNumber;
    data['maritalStatus'] = maritalStatus;
    data['shopName'] = shopName;
    data['email'] = email;
    data['provider'] = provider;
    data['isVerified'] = isVerified;
    data['verificationToken'] = verificationToken;
    data['password'] = password;
    data['dob'] = dob;
    data['marriageDate'] = marriageDate;
    if (profileImage != null) {
      data['profileImage'] = profileImage!.toJson();
    }
    data['accessController'] = accessController;
    data['passwordResetOtp'] = passwordResetOtp;
    data['approved'] = approved;
    data['isDarkakVerified'] = isDarkakVerified;
    data['paymentDetails'] = paymentDetails;
    data['gender'] = gender;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['warehouseAddress'] = warehouseAddress;
    data['returnAddress'] = returnAddress;
    data['business'] = business;
    data['ep_id'] = epId;
    data['pick_hub'] = pickHub;
    return data;
  }
}



class ProfileImage {
  String? id;
  String? filename;
  String? originalname;
  String? path;
  String? destination;
  String? mimetype;
  int? size;

  ProfileImage(
      {this.id,
        this.filename,
        this.originalname,
        this.path,
        this.destination,
        this.mimetype,
        this.size});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filename = json['filename'];
    originalname = json['originalname'];
    path = json['path'];
    destination = json['destination'];
    mimetype = json['mimetype'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filename'] = filename;
    data['originalname'] = originalname;
    data['path'] = path;
    data['destination'] = destination;
    data['mimetype'] = mimetype;
    data['size'] = size;
    return data;
  }
}

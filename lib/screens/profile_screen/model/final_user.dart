// class User {
//   String? id;
//   String? name;
//   String? mobile;
//   String? role;
//   String? email;
//   bool? isVerified;
//   String? verificationToken;
//   String? password;
//   String? dob;
//   String? marriageDate;
//   ProfileImage? profileImage;
//
//   User(
//       {this.id,
//         this.name,
//         this.mobile,
//         this.role,
//         this.email,
//         this.isVerified,
//         this.verificationToken,
//         this.password,
//         this.dob,
//         this.marriageDate,
//         this.profileImage,
//        });
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     mobile = json['mobile'];
//     role = json['role'];
//     email = json['email'];
//     isVerified = json['isVerified'];
//     verificationToken = json['verificationToken'];
//     password = json['password'];
//     dob = json['dob'];
//     marriageDate = json['marriageDate'];
//     profileImage = json['profileImage'] != null
//         ? ProfileImage.fromJson(json['profileImage'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['mobile'] = mobile;
//     data['role'] = role;
//     data['email'] = email;
//     data['isVerified'] = isVerified;
//     data['verificationToken'] = verificationToken;
//     data['password'] = password;
//     data['dob'] = dob;
//     data['marriageDate'] = marriageDate;
//     if (profileImage != null) {
//       data['profileImage'] = profileImage!.toJson();
//     }
//     return data;
//   }
// }
//
// class ProfileImage {
//   String? id;
//   String? filename;
//   String? originalname;
//   String? path;
//   String? destination;
//   String? mimetype;
//   int? size;
//
//   ProfileImage(
//       {this.id,
//         this.filename,
//         this.originalname,
//         this.path,
//         this.destination,
//         this.mimetype,
//         this.size});
//
//   ProfileImage.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     filename = json['filename'];
//     originalname = json['originalname'];
//     path = json['path'];
//     destination = json['destination'];
//     mimetype = json['mimetype'];
//     size = json['size'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['filename'] = filename;
//     data['originalname'] = originalname;
//     data['path'] = path;
//     data['destination'] = destination;
//     data['mimetype'] = mimetype;
//     data['size'] = size;
//     return data;
//   }
// }

// class Images {
//   String? id;
//   String? filename;
//   String? originalname;
//   String? path;
//   String? destination;
//   String? mimetype;
//   int? size;
//
//   Images(
//       {this.id,
//         this.filename,
//         this.originalname,
//         this.path,
//         this.destination,
//         this.mimetype,
//         this.size});
//
//   Images.fromJson(Map<String, dynamic> json) {
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
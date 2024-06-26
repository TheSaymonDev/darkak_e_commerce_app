class ColorsP {
  String? id;
  String? name;
  String? description;
  bool? isActive;

  ColorsP({this.id, this.name, this.description, this.isActive});

  ColorsP.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['isActive'] = isActive;
    return data;
  }
}

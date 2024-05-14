class Unit {
  String? id;
  String? name;
  String? shortName;
  String? description;
  bool? isActive;

  Unit({this.id, this.name, this.shortName, this.description, this.isActive});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
    description = json['description'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['shortName'] = shortName;
    data['description'] = description;
    data['isActive'] = isActive;
    return data;
  }
}

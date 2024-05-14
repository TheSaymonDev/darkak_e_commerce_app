class Warranty {
  String? id;
  String? name;
  String? duration;
  String? description;
  bool? isActive;

  Warranty(
      {this.id, this.name, this.duration, this.description, this.isActive});

  Warranty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    description = json['description'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['duration'] = duration;
    data['description'] = description;
    data['isActive'] = isActive;
    return data;
  }
}
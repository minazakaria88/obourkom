class CarModel {
  int? id;
  String? name;
  String? image;

  CarModel({required this.id, required this.name, required this.image});

  CarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}

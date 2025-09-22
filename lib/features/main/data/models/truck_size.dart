class TruckSizeModel {
  int? id;
  String? name;
  String? image;

  TruckSizeModel({this.id, this.name, this.image});

  TruckSizeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}

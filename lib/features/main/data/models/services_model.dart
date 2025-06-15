import 'package:oborkom/generated/assets.dart';

class ServicesModel {
  ServicesModel({required this.id, required this.name, required this.image});

  final int id;
  final String name;
  final String image;
}


List<ServicesModel> servicesList = [
  ServicesModel(id: 1, name: 'Fridges', image: Assets.imagesFridges),
  ServicesModel(id: 2, name: 'Furniture', image: Assets.imagesFurniture),
  ServicesModel(id: 3, name: 'Plumbing', image: Assets.imagesFridges),
  ServicesModel(id: 4, name: 'Painting', image: Assets.imagesFridges),
  ServicesModel(id: 5, name: 'Moving', image:  Assets.imagesFurniture),
  ServicesModel(id: 1, name: 'Cleaning', image: Assets.imagesFridges),
  ServicesModel(id: 2, name: 'Electrical', image: Assets.imagesFurniture),
  ServicesModel(id: 3, name: 'Fridges', image: Assets.imagesFridges),
  ServicesModel(id: 4, name: 'Furniture', image: Assets.imagesFridges),
  ServicesModel(id: 5, name: 'Moving', image:  Assets.imagesFurniture),
];

import 'package:oborkom/main.dart';

import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class CarModel {
  final int id;
  final String name;
  final int type;
  final String image;

  CarModel({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
  });
}

List<CarModel> carList = [
  CarModel(
    id: 1,
    name: S.of(NavigatorClass.navigatorKey.currentState!.context).smallCars,
    type: 1,
    image: Assets.imagesSmallCar,
  ),
  CarModel(
    id: 2,
    name: S.of(NavigatorClass.navigatorKey.currentState!.context).bigCars,
    type: 2,
    image: Assets.imagesBigCar,
  ),
];

import 'package:oborkom/generated/assets.dart';

import '../../../../generated/l10n.dart';
import '../../../../main.dart';

/// home , work , other
class LocationTypeModel {
  final int id;
  final String name;
  final String image;

  LocationTypeModel({
    required this.id,
    required this.name,
    required this.image,
  });
}

List<LocationTypeModel> locationTypes = [
  LocationTypeModel(
    id: 1,
    name: S.of(NavigatorClass.navigatorKey.currentState!.context).home,
    image: Assets.imagesProfileHome,
  ),
  LocationTypeModel(
    id: 2,
    name: S.of(NavigatorClass.navigatorKey.currentState!.context).work,
    image: Assets.imagesWork,
  ),
  LocationTypeModel(
    id: 3,
    name: S.of(NavigatorClass.navigatorKey.currentState!.context).other,
    image: Assets.imagesOtherAddLocations,
  ),
];

Map<int, String> idToLocationType = {1: 'home', 2: 'office', 3: 'other'};

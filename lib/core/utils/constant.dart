

import 'package:logger/logger.dart';
import 'package:oborkom/features/locations/presentation/cubit/locations_cubit.dart';

import '../../generated/assets.dart';

enum MapTypes
{
  orderPick,
  addLocation,
}

class MapContext
{
  final MapTypes type;
  final LocationsCubit ? cubit;

  MapContext({required this.type,this.cubit});
}


enum PaymentMethods
{
  applePay,
  card,
}


Map<String, String> addressToImage = {
  'home':Assets.imagesProfileHome,
  'work':Assets.imagesWork,
  'other':Assets.imagesOtherAddLocations
};




var logger = Logger();

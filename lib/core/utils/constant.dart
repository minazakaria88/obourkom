

import 'package:logger/logger.dart';

import '../../generated/assets.dart';

enum MapTypes
{
  orderPick,
  addLocation,
}

class MapContext
{
  final MapTypes type;
  MapContext({required this.type});
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


enum OtpType
{
  login,
  register
}




var logger = Logger();

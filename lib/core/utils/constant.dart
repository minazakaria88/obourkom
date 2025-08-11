import 'package:logger/logger.dart';

import '../../generated/assets.dart';

enum MapTypes { orderPick, addLocation }

class MapContext {
  final MapTypes type;
  MapContext({required this.type});
}

enum PaymentMethods { applePay, card }

Map<String, String> addressToImage = {
  'home': Assets.imagesProfileHome,
  'office': Assets.imagesWork,
  'other': Assets.imagesOtherAddLocations,
};



enum OtpType { login, register }

Map<String, int> statusToNumber = {
  'available': -1,
  'negotiating': 0,
  'on_the_way_to_pickup': 1,
  'on_the_way_to_delivery': 2,
  'delivered': 3,
};

var logger = Logger();

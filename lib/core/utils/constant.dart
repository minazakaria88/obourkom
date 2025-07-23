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
  'work': Assets.imagesWork,
  'other': Assets.imagesOtherAddLocations,
};

enum OtpType { login, register }

Map<String, int> statusToNumber = {'pending': 0, 'inWay': 1, 'completed': 2};

var logger = Logger();

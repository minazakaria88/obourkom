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
  available: -1,
  negotiating: 0,
  onTheWayToPickup: 1,
  onTheWayToDelivery: 2,
  delivered: 3,
};

const available = 'available';
const negotiating = 'negotiating';
const onTheWayToPickup = 'on_the_way_to_pickup';
const onTheWayToDelivery = 'on_the_way_to_delivery';
const delivered = 'delivered';

var logger = Logger();

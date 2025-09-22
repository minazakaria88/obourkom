import 'package:logger/logger.dart';

import '../../generated/assets.dart';
import '../../generated/l10n.dart';

enum MapTypes { orderPick, addLocation }

class MapContext {
  final MapTypes type;
  MapContext({required this.type});
}

enum PaymentMethods { applePay, card, mada }

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

String getStatusText(context, value) {
  Map<String, String> mapToText = {
    available: S.of(context).available,
    negotiating: S.of(context).negotiation,
    onTheWayToPickup: S.of(context).onTheWayToPickup,
    onTheWayToDelivery: S.of(context).onTheWayToDelivery,
    delivered: S.of(context).delivered,
  };

  return mapToText[value] ?? '';
}

const available = 'available';
const negotiating = 'negotiating';
const onTheWayToPickup = 'on_the_way_to_pickup';
const onTheWayToDelivery = 'on_the_way_to_delivery';
const delivered = 'delivered';

var logger = Logger();

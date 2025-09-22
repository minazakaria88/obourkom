import 'package:oborkom/features/orders/data/models/submit_order_model.dart';

import 'order_model.dart';

class OrderAdapterModel {
  static SubmitOrderModel fromOrderModel(OrderDataModel model) {
    return SubmitOrderModel(
      id: model.id,
      fromLat: model.fromLat,
      fromLng: model.fromLng,
      toLat: model.toLat,
      toLng: model.toLng,
      paymentType: model.paymentType,
      notes: model.notes,
      code: model.code,
      truckTypeId: model.truckType?.name.toString(),
      truckSizeId: model.truckSize?.name.toString(),
      priceTo: double.tryParse(model.priceTo ?? ''),
      priceFrom: double.tryParse(model.priceFrom ?? ''),
      typeService: model.typeService,
      status: model.status,
      addressFrom: model.fromAddress,
      addressTo: model.toAddress,
      createdAt: model.createdAt,
    );
  }
}

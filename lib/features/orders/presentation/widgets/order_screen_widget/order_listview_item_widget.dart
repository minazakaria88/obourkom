import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/offer_model.dart';
import 'package:oborkom/features/orders/data/models/order_model.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../find_and_chat_with_driver/presentation/widgets/finding_driver_widgets/order_details_item_widget.dart';
import '../../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';
import '../../../data/models/submit_order_model.dart';

class OrderListviewItemWidget extends StatelessWidget {
  const OrderListviewItemWidget({super.key, required this.model});

  final OrderDataModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(model.status=='delivered'){
          context.pushNamed(
            Routes.completedOrderDetails,
            arguments: model
          );
        }
        else if(model.status=='available')
          {
            context.pushNamed(
              Routes.findDriver,
              arguments: SubmitOrderModel(
                id: model.id,
                fromLat: model.fromLat,
                fromLng: model.fromLng,
                toLat: model.toLat,
                toLng: model.toLng,
                paymentType: model.paymentType,
                notes: model.notes,
                code: model.code,
                priceFrom: double.tryParse(model.priceFrom??''),
                priceTo: double.tryParse(model.priceTo ??''),
                status: model.status,
                truckTypeId: model.truckSize?.name.toString(),
                truckSizeId: model.truckSize?.name.toString(),
                createdAt: model.createdAt,
              ),
            );
          }
        else
          {
            if(model.offers==null||model.offers!.isEmpty){
              return;
            }
            Offer offer= model.offers!.where((e)=>e.id==model.acceptedOfferId).first;
            context.pushNamed(
              Routes.orderDetails,
              arguments: {
                'order':SubmitOrderModel(
                  id: model.id,
                  fromLat: model.fromLat,
                  fromLng: model.fromLng,
                  toLat: model.toLat,
                  toLng: model.toLng,
                  paymentType: model.paymentType,
                  notes: model.notes,
                  code: model.code,
                  status: model.status,
                  truckTypeId: model.truckType?.name.toString(),
                  truckSizeId: model.truckSize?.name.toString(),
                  createdAt: model.createdAt,
                ),
                'driver': OfferModel(
                  driverId: offer.driverId,
                  price: offer.price,
                ),
              },
            );
          }

      },
      child: BackgroundProfileWidget(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        10.width,
                        SvgPicture.asset(
                          model.status != 'delivered'
                              ? Assets.imagesPending
                              : Assets.imagesProfile,
                        ),
                        10.width,
                        Text(
                         model.status == 'delivered' ? S.of(context).delivered : S.of(context).pending,
                          style: AppTextStyles.bold18Black,
                        ),
                      ],
                    ),
                    const Divider(thickness: 2, color: Colors.grey),
                    OrderDetailsItemWidget(
                      value: '#${model.id}',
                      title: S.of(context).orderNumber,
                    ),
                    OrderDetailsItemWidget(
                      value: model.typeService ?? '',
                      title: S.of(context).serviceType,
                    ),
                    OrderDetailsItemWidget(
                      value: model.truckSize!.name  ?? '',
                      title: S.of(context).carType,
                    ),
                    OrderDetailsItemWidget(
                      value: model.price ?? '',
                      title: S.of(context).total,
                    ),
                  ],
                ),
              ),
              10.width,
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}

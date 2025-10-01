import 'package:flutter/material.dart';
import 'package:oborkom/features/orders/data/models/order_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../generated/l10n.dart';
import '../../../../find_and_chat_with_driver/presentation/widgets/finding_driver_widgets/order_details_item_widget.dart';
import '../../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';

class CompleteOrderDetailsWidget extends StatelessWidget {
  const CompleteOrderDetailsWidget({super.key, required this.model});
  final OrderDataModel model;

  @override
  Widget build(BuildContext context) {
    return BackgroundProfileWidget(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(S.of(context).orderDetails, style: AppTextStyles.bold18Black),
            const Divider(thickness: 1.2, color: Colors.grey),
            OrderDetailsItemWidget(
              value: '#${model.id}',
              title: S.of(context).orderNumber,
            ),
            OrderDetailsItemWidget(
              value: model.typeService ?? '',
              title: S.of(context).serviceType,
            ),
            OrderDetailsItemWidget(
              value: model.truckSize?.name ?? '',
              title: S.of(context).carType,
            ),
            OrderDetailsItemWidget(
              value: '${model.paymentType}',
              title: S.of(context).paymentMethod,
            ),
            OrderDetailsItemWidget(
              value: '${model.createdAt}',
              title: S.of(context).orderDate,
            ),
            OrderDetailsItemWidget(
              value: getStatusText(context, model.status),
              title: S.of(context).orderStatus,
              color: AppColors.greenColor,
            ),
          ],
        ),
      ),
    );
  }
}

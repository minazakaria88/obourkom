import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../find_and_chat_with_driver/presentation/widgets/finding_driver_widgets/order_details_item_widget.dart';
import '../../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';

class CompleteOrderDetailsWidget extends StatelessWidget {
  const CompleteOrderDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundProfileWidget(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).orderDetails,
              style: AppTextStyles.bold18Black,
            ),
            const Divider(thickness: 1.2, color: Colors.grey),
            OrderDetailsItemWidget(
              value: '#100',
              title: S.of(context).orderNumber,
            ),
            OrderDetailsItemWidget(
              value: 'نقل أثاث',
              title: S.of(context).serviceType,
            ),
            OrderDetailsItemWidget(
              value: 'كبيرة',
              title: S.of(context).carType,
            ),
            OrderDetailsItemWidget(
              value: 'أبل باي',
              title: S.of(context).paymentMethod,
            ),
            OrderDetailsItemWidget(
              value: '13/11/2024',
              title: S.of(context).orderDate,
            ),
            OrderDetailsItemWidget(
              value: 'تم التوصيل',
              title: S.of(context).orderStatus,
            ),

          ],
        ),
      ),
    );
  }
}

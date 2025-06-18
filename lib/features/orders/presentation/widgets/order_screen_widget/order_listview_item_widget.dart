import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';
import '../../cubit/orders_cubit.dart';
import '../finding_driver_widgets/order_details_item_widget.dart';

class OrderListviewItemWidget extends StatelessWidget {
  const OrderListviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.completedOrderDetails,
          arguments: context.read<OrdersCubit>(),
        );
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
                        SvgPicture.asset(Assets.imagesPending),
                        10.width,
                        Text(S.of(context).pending, style: AppTextStyles.bold18Black),
                      ],
                    ),
                    const Divider(thickness: 2, color: Colors.grey),

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
                  ],
                ),
              ),
              10.width,
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}

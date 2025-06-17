import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';
import 'package:oborkom/generated/l10n.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/assets.dart';
import '../widgets/finding_driver_widgets/order_details_item_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 70,
            child: CupertinoSlidingSegmentedControl(
              children: {
                0: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    S.of(context).currentOrders,
                    style: selectedIndex == 0
                        ? AppTextStyles.bold18Black.copyWith(
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                1: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    S.of(context).previous,
                    style: selectedIndex == 1
                        ? AppTextStyles.bold18Black.copyWith(
                      color: Colors.white,
                    )
                        : null,
                  ),
                ),
              },
              thumbColor: AppColors.mainColor,
              groupValue: selectedIndex,
              onValueChanged: (value) {
                if (value == null) return;
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          20.height,
          BackgroundProfileWidget(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      10.width,
                      SvgPicture.asset(Assets.imagesPending),
                      10.width,
                      Text(
                        S.of(context).pending,
                        style: AppTextStyles.bold18Black,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),

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
          ),
        ],
      ),
    );
  }
}

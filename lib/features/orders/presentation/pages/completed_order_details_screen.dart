import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/my_app_bar.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../profile/presentation/widgets/profile_screen_widgets/profile_image.dart';
import '../widgets/finding_driver_widgets/order_details_item_widget.dart';

class CompletedOrderDetailsScreen extends StatelessWidget {
  const CompletedOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).orderDetails),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackgroundProfileWidget(
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
                    ],
                  ),
                ),
              ),
              20.height,
              BackgroundProfileWidget(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).notes,
                        style: AppTextStyles.bold18Black,
                      ),
                      10.height,
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.mainColor.withAlpha(60),
                        ),
                        child: Text(
                          'تفاصيل الطلب مثال للنص يكتب هنا في هذه المساحة او امثر اذا تطلب الأمر',
                          style: AppTextStyles.regular12Grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.height,
              BackgroundProfileWidget(
                child: Row(
                  children: [
                    const ProfileImage(),
                    20.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mina Zakaria', style: AppTextStyles.bold18Black),
                        Row(
                          children: [
                            SvgPicture.asset(Assets.imagesStars),
                            5.width,
                            Text('4.5', style: AppTextStyles.bold18Black),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              20.height,
              BackgroundProfileWidget(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        S.of(context).paymentSummary,
                        style: AppTextStyles.bold18Black,
                      ),
                      const Divider(thickness: 1.2, color: Colors.grey),
                      OrderDetailsItemWidget(
                        value: '0.00 ريال',
                        title: S.of(context).orderValue,
                      ),
                      OrderDetailsItemWidget(
                        value: '0.200 ريال',
                        title: S.of(context).shipmentValue,
                      ),
                      OrderDetailsItemWidget(
                        value: '0.00 ريال',
                        title: S.of(context).discount,
                      ),
                      const Divider(thickness: 1.2, color: Colors.grey),
                      Row(
                        children: [
                          Expanded(
                            child: MyButton(
                              title: S.of(context).Invoice,
                              color: AppColors.mainColor,
                              onTap: () {},
                            ),
                          ),
                          10.width,
                          Expanded(
                            child: MyButton(
                              title: S.of(context).evaluation,
                              color: AppColors.darkGreyColor,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

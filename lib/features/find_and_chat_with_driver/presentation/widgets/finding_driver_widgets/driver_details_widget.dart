import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/offer_model.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/my_button.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';
import '../../../../profile/presentation/widgets/profile_screen_widgets/profile_image.dart';

class DriverDetailsWidget extends StatelessWidget {
  const DriverDetailsWidget({
    super.key, required this.accept, required this.decline, required this.model,
  });

  final Function accept;
  final Function decline;
  final OfferModel model;

  @override
  Widget build(BuildContext context) {
    return BackgroundProfileWidget(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileImage(),
                10.width,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${model.name} ',
                        style: AppTextStyles.bold18Black,
                      ),
                      5.height,
                      Row(
                        children: [
                          SvgPicture.asset(Assets.imagesStars),
                          5.width,
                          Text(
                            '4.5',
                            style: AppTextStyles.bold18Black,
                          ),
                          20.width,
                          SvgPicture.asset(
                            Assets.imagesDocuments,
                          ),
                          5.width,
                          Text(
                            '500',
                            style: AppTextStyles.bold18Black,
                          ),
                        ],
                      ),
                      5.height,
                      const Divider(
                        color: AppColors.greyColor,
                        thickness: 2,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.imagesBanknote),
                          10.width,
                          Text(
                            '${model.price} ريال',
                            style: AppTextStyles.bold18Black
                                .copyWith(
                              color: AppColors.mainColor,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
            20.height,
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: MyButton(
                      textColor: Colors.black,
                      title: S.of(context).decline,
                      color: const Color(0xffF5FAFA),
                      onTap: () {
                        decline();
                      },
                    ),
                  ),
                  Expanded(
                    child: MyButton(
                      title: S.of(context).accept,
                      onTap: () {
                        accept();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

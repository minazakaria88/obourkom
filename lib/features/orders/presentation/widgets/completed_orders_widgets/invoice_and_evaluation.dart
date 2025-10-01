import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/orders/data/models/order_model.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/my_button.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../rating/presentation/pages/rating_widget.dart';

class CompleteOrderInvoiceAndEvaluationWidget extends StatefulWidget {
  const CompleteOrderInvoiceAndEvaluationWidget({
    super.key,
    required this.orderDataModel,
  });
  final OrderDataModel orderDataModel;

  @override
  State<CompleteOrderInvoiceAndEvaluationWidget> createState() =>
      _CompleteOrderInvoiceAndEvaluationWidgetState();
}

class _CompleteOrderInvoiceAndEvaluationWidgetState
    extends State<CompleteOrderInvoiceAndEvaluationWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.orderDataModel.driverRate.isNullOrEmpty()) SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: CupertinoSlidingSegmentedControl(
                      groupValue: selectedIndex,
                      thumbColor: AppColors.mainColor,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                      children: {
                        0: CompletedOrderButton(
                          title: S.of(context).Invoice,
                          image: Assets.imagesDocumentOrder,
                          isSelected: selectedIndex == 0,
                        ),
                        1: CompletedOrderButton(
                          title: S.of(context).evaluation,
                          image: Assets.imagesStarsOrder,
                          isSelected: selectedIndex == 1,
                        ),
                      },
                      onValueChanged: (value) async {
                        setState(() {
                          selectedIndex = value!;
                        });
                        if (selectedIndex == 1) {
                          final index = await showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => MyRatingWidget(
                              orderDataModel: widget.orderDataModel,
                            ),
                          );
                          if(mounted)
                          {
                            if (index != null) {
                              setState(() {
                                selectedIndex = 0;
                              });
                            }
                          }
                        }
                      },
                    ),
                  ) else MyButton(
                    title: S.of(context).Invoice,
                    color: AppColors.mainColor,
                    onTap: () {},
                  ),
          ],
        ),
      ),
    );
  }
}

class CompletedOrderButton extends StatelessWidget {
  const CompletedOrderButton({
    super.key,
    required this.title,
    required this.image,
    required this.isSelected,
  });
  final String title;
  final String image;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            colorFilter: ColorFilter.mode(
              isSelected ? Colors.white : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          10.width,
          Text(
            title,
            style: AppTextStyles.bold14Grey.copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

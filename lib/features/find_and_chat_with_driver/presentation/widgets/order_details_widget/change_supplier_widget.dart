import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/my_button.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class ChangeSupplierWidget extends StatelessWidget {
  const ChangeSupplierWidget({super.key, required this.onTap});
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffE8FFFE).withAlpha(100),
            ),
            child: SvgPicture.asset(Assets.imagesLogout),
          ),
          10.height,
          Text(S.of(context).changeSupplier, style: AppTextStyles.bold18Black),
          20.height,
          Text(
            S.of(context).doYouWantToChangeSupplier,
            textAlign: TextAlign.center,
            style: AppTextStyles.regular16Black,
          ),
          20.height,
          Row(
            children: [
              Expanded(
                child: MyButton(
                  title: S.of(context).yes,
                  color: AppColors.mainColor,
                  onTap: (){
                    onTap();
                  },
                ),
              ),
              Expanded(
                child: MyButton(
                  title: S.of(context).no,
                  color: AppColors.red,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          10.height,
        ],
      ),
    );
  }
}

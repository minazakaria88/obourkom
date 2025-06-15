import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/utils/app_colors.dart';
import 'package:oborkom/core/utils/app_styles.dart';
import 'package:oborkom/core/widgets/my_app_bar.dart';
import 'package:oborkom/generated/assets.dart';
import 'package:oborkom/generated/l10n.dart';

import '../../../../../core/functions/make_phone_call.dart';
import '../../../../../core/functions/whatsapp.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).support),
      body: Column(
        children: [
          20.height,
          SupportItemWidget(
            onTap: (){
              makePhoneCall(phoneNumber: '+201064687742');
            },
            title: S.of(context).callUs,
            image: Assets.imagesCall,
          ),
          10.height,
          SupportItemWidget(
            onTap: (){
              whatsapp(phoneNumber: '+201064687742');
            },
            title: S.of(context).whatsapp,
            image: Assets.imagesWhatsapp,
          ),

        ],
      ),
    );
  }
}

class SupportItemWidget extends StatelessWidget {
  const SupportItemWidget({
    super.key, required this.image, required this.title, required this.onTap,
  });
  final String image;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withAlpha(100),
              offset: const Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 2
            ),
          ]
        ),
        child: Row(
          children: [
            SvgPicture.asset(image),
            20.width,
            Text(title,style: AppTextStyles.regular16Black,),
          ],
        ),
      ),
    );
  }
}




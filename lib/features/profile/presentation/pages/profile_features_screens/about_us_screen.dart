import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/widgets/my_app_bar.dart';
import 'package:oborkom/generated/assets.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).faq),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            20.height,
            SvgPicture.asset(Assets.imagesAboutUsFaq),
            30.height,
            Card(
              color: Colors.white,
              child: ExpansionTile(
                shape:  const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                title: Text(
                  'what is oborkom??',
                  style: AppTextStyles.regular16Black,
                ),
                childrenPadding: const EdgeInsets.all(10),
                children: [
                  Text(
                    'oborkom is a platform that connects you with a person who can help you with a problem you have',
                    style: AppTextStyles.regular12Grey,
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

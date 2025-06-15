import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/profile/presentation/widgets/profile_screen_widgets/profile_image.dart';
import 'package:oborkom/generated/assets.dart';
import '../../../../core/widgets/my_app_bar.dart';
import '../../../../generated/l10n.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).personalAccount),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          30.height,
          const SizedBox(width: double.infinity),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const ProfileImage(height: 117, width: 117),
              Positioned(
                top: 70,
                left: 50,
                child: SvgPicture.asset(Assets.imagesEditImage),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

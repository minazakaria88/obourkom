import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class LocationItemEditWidget extends StatelessWidget {
  const LocationItemEditWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          SvgPicture.asset(Assets.imagesEdit),
          5.width,
          Text(
            S.of(context).edit,
            style: AppTextStyles.regular12Grey,
          ),
        ],
      ),
    );
  }
}

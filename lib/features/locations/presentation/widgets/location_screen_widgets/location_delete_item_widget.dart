
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class LocationItemDeleteWidget extends StatelessWidget {
  const LocationItemDeleteWidget({
    super.key, required this.onDelete,
  });
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onDelete();
      },
      child: Row(
        children: [
          SvgPicture.asset(Assets.imagesDelete),
          5.width,
          Text(
            S.of(context).delete,
            style: AppTextStyles.regular12Grey,
          ),
        ],
      ),
    );
  }
}

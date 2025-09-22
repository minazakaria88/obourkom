import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';

class CompleteOrderNotesWidget extends StatelessWidget {
  const CompleteOrderNotesWidget({super.key, required this.notes});
  final String notes;

  @override
  Widget build(BuildContext context) {
    return BackgroundProfileWidget(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).notes, style: AppTextStyles.bold18Black),
            10.height,
            const SizedBox(width: double.infinity),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.mainColor.withAlpha(60),
              ),
              child: Text(
                notes,
                textAlign: TextAlign.center,
                style: AppTextStyles.regular16Black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

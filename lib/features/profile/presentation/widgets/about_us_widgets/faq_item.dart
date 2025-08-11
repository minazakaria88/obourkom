import 'package:flutter/material.dart';
import 'package:oborkom/features/profile/data/models/faq_model.dart';

import '../../../../../core/utils/app_styles.dart';

class FaqItem extends StatelessWidget {
  const FaqItem({
    super.key, required this.model,
  });
  final Questions model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        shape:  const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        title: Text(
          model.title??'',
          style: AppTextStyles.regular16Black,
        ),
        childrenPadding: const EdgeInsets.all(10),
        children: [
          Text(
            model.content??'',
            style: AppTextStyles.regular12Grey,
          ),
        ],
      ),
    );
  }
}

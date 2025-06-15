import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/utils/app_styles.dart';

class NewOrderInputWidget extends StatelessWidget {
  const NewOrderInputWidget({
    super.key,
    required this.title,
     this.value,
    required this.onTap,
  });
  final String title;
  final String ? value;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical:value != null ? 10 : 20),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffDCE0E0)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bold18Black.copyWith(fontSize: 14),
                ),
                if(value != null)...[
                  10.height,
                  Text(
                    value ?? '',
                    style: AppTextStyles.regular12MainColor,
                  ),
                ],

              ],
            ),
          ),
          IconButton(
            onPressed: () {
              onTap();
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

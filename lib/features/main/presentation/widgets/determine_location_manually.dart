import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class DetermineLocationManually extends StatelessWidget {
  const DetermineLocationManually({super.key, required this.onTap});
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xffF5FAFA),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            S.of(context).determineLocationManually,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

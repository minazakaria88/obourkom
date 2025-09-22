import 'package:flutter/material.dart';

class ChooseTypeWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String image;

  const ChooseTypeWidget({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:const Color(0xfff5f6fa),
        ),
        child: Image.asset(
          image,
          height: 120,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

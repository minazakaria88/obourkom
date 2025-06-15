import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    this.suffixIcon,
    required this.validator,
    this.prefixIcon,
    this.textInputType,
    this.onChange,
  });
  final TextEditingController controller;
  final String hint;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      onChanged: onChange,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      cursorColor: AppColors.mainColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.mainColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

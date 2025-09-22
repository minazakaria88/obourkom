import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';

class ValidateWidget extends StatelessWidget {
  const ValidateWidget({
    super.key,
    required this.validator,
    required this.child,
  });
  final Function validator;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (field) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          child,
          10.height,
          if (field.errorText != null)
            Text(
              field.errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
        ],
      ),
      validator: (value) => validator(),
    );
  }
}

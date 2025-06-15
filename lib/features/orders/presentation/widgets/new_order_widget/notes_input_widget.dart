import 'package:flutter/material.dart';

import '../../../../../core/helpers/validation_inputs_class.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';

class NotesInputWidget extends StatelessWidget {
  const NotesInputWidget({
    super.key, required this.controller,
  });
  final TextEditingController controller ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 5,
      validator: (String? value) {
        return ValidationClass.validateText(value, S.of(context).pleaseWriteYourNotes);
      },
      decoration: InputDecoration(
        hintText: S.of(context).writeYourNotesHere,
        filled: true,
        fillColor: AppColors.newOrderGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
          BorderSide.none, // No visible border line
        ),
        contentPadding: const EdgeInsets.all(
          12,
        ), // Optional: adds spacing inside
      ),
    );
  }
}

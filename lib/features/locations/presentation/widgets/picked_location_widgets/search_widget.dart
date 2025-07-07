import 'package:flutter/material.dart';

import '../../../../../core/helpers/validation_inputs_class.dart';
import '../../../../../core/widgets/my_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: MyTextFormField(
          prefixIcon: const Icon(Icons.search),
          controller: TextEditingController(),
          hint: S.of(context).searchOnMap,
          validator: (String? value) {
            return ValidationClass.validateText(
              value,
              S.of(context).location,
            );
          },
        ),
      ),
    );
  }
}

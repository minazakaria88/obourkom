import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/helpers/validation_inputs_class.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/my_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/orders_cubit.dart';

class DiscountInputWidget extends StatefulWidget {
  const DiscountInputWidget({
    super.key, required this.controller,
  });
  final TextEditingController controller;

  @override
  State<DiscountInputWidget> createState() => _DiscountInputWidgetState();
}

class _DiscountInputWidgetState extends State<DiscountInputWidget> {
  late ValueNotifier<String> inputValue;

  @override
  void initState() {
    super.initState();
    inputValue = ValueNotifier(widget.controller.text);
    widget.controller.addListener(() {
      inputValue.value = widget.controller.text;
    });
  }

  @override
  void dispose() {
    inputValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
      textInputType: TextInputType.text,
      onChange: (value) {
        // optional if you want to manually trigger things
        inputValue.value = value;
      },
      controller: widget.controller,
      suffixIcon: ValueListenableBuilder<String>(
        valueListenable: inputValue,
        builder: (context, value, child) => InkWell(
          onTap: () {
            log('Discount Code: ${value.isNullOrEmpty() ? 'Empty' : value}');
            context.read<OrdersCubit>().setDiscountCode(value);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(5),
            width: 72,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: value.isNullOrEmpty() ? Colors.redAccent : Colors.greenAccent,
            ),
            child: Center(
              child: Text(
                S.of(context).active,
                style: AppTextStyles.bold14White,
              ),
            ),
          ),
        ),
      ),
      hint: S.of(context).enterDiscountCode,
      validator: (value) {
        return ValidationClass.validateText(value, '');
      },
    );
  }
}

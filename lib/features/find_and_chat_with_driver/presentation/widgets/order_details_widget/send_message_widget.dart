import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helpers/validation_inputs_class.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/my_text_form_field.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/find_and_chat_with_driver_cubit.dart';

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({
    super.key,
    required this.cubit, required this.driverId, required this.orderId,
  });

  final FindAndChatWithDriverCubit cubit;
  final String driverId;
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: MyTextFormField(
          prefixIcon: IconButton(
            onPressed: () {
              cubit.sendMessage(
                driverId: driverId,
                orderId: orderId,
                message: cubit.messageController.text,
              );
            },
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.darkMainColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(Assets.imagesSendButton),
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.imagesMicrophoneIcon),
          ),
          controller: cubit.messageController,
          hint: S.of(context).writeYourMessage,
          validator: (value) => ValidationClass.validateText(
            value,
            S.of(context).pleaseWriteYourMessage,
          ),
        ),
      ),
    );
  }
}

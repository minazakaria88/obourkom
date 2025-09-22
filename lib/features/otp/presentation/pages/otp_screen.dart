import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/functions/show_snack_bar.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/core/widgets/loading_widget.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/functions/hide_keyboard.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/otp_cubit.dart';
import '../widgets/dont_receive_the_code.dart';
import '../widgets/otp_header_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.otpType,
    required this.phoneNumber,
  });
  final OtpType otpType;
  final String phoneNumber;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    listenForCode();
    super.initState();
  }

  @override
  dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  Future<void> listenForCode() async {
    await SmsAutoFill().listenForCode();
  }

  String otpCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const OtpHeaderWidget(),
              BlocConsumer<OtpCubit, OtpState>(
                listenWhen: (previous, current) =>
                    previous.successVerifyOtp != current.successVerifyOtp ||
                    previous.failureVerifyOtp != current.failureVerifyOtp,
                listener: (context, state) {
                  if (state.successVerifyOtp) {
                    context.pushNamedAndRemoveUntil(
                      Routes.home,
                      (context) => false,
                    );
                    showToastification(
                      message: S.of(context).loginSuccessfully,
                      context: context,
                      type: ToastificationType.success,
                    );
                  }
                  if (state.failureVerifyOtp) {
                    showToastification(
                      message: state.errorMessage ?? '',
                      context: context,
                      type: ToastificationType.error,
                    );
                  }
                },
                builder: (context, state) {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          _buildOtpInput(state),
                          20.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).codeExpiredIn,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              10.width,
                              Text(
                                '${state.otpTimerDuration!.inMinutes.toString().padLeft(2, '0')}:${state.otpTimerDuration!.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          20.height,
                          DontReceiveTheCodeWidget(
                            onTap: () {
                              context.read<OtpCubit>().resendOtp(
                                phoneNumber: widget.phoneNumber,
                                otpType: widget.otpType,
                              );
                            },
                          ),
                        ],
                      ),
                      if (state.loadingVerifyOtp) const LoadingWidget(),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpInput(OtpState state) {
    return SizedBox(
      height: 60,
      child: PinFieldAutoFill(
        decoration: BoxLooseDecoration(
          gapSpace: 20,
          errorTextStyle: const TextStyle(color: Colors.red),
          strokeColorBuilder: state.otpTimerDuration == Duration.zero
              ? const FixedColorBuilder(Colors.red)
              : const FixedColorBuilder(AppColors.greyColor),
          bgColorBuilder: const FixedColorBuilder(AppColors.greyColor),
          textStyle: const TextStyle(color: AppColors.mainColor, fontSize: 24),
        ),
        keyboardType: TextInputType.number,
        currentCode: otpCode,
        onCodeSubmitted: (String code) {
          otpCode = code;
        },
        onCodeChanged: (String? code) async {
          otpCode = code ?? '';
          logger.i(code);
          if ((code ?? '').length == 4) {
            if (context.mounted) {
              hideKeyboard(context);
            }
            await context.read<OtpCubit>().verifyOtp(
              otp: code ?? '',
              otpType: widget.otpType,
            );
            otpCode = '';
          }
        },
        codeLength: 4,
        cursor: Cursor(width: 2, height: 20, color: AppColors.mainColor),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/widgets/loading_widget.dart';
import 'package:oborkom/features/register/presentation/widgets/register_header_widget.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/helpers/validation_inputs_class.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/widgets/my_back_button.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../cubit/register_cubit.dart';
import '../widgets/terma_privacy_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ValueNotifier<bool> isAccept = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state.isFailure) {
              showToastification(
                message: state.errorMessage ?? '',
                context: context,
                type: ToastificationType.error,
              );
            }
            if (state.isSuccess) {
              Navigator.pushNamed(
                context,
                Routes.otp,
                arguments: {
                  'phone': context.read<RegisterCubit>().phoneController.text,
                  'otpType': OtpType.register,
                },
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<RegisterCubit>();
            return Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  40.height,
                  const MyBackButton(),
                  5.height,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(child: RegisterHeaderWidget()),
                              20.height,
                              Text(
                                S.of(context).phoneNumber,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              10.height,
                              MyTextFormField(
                                controller: cubit.phoneController,
                                validator: (String? value) {
                                  return ValidationClass.validatePhone(
                                    value,
                                    context,
                                  );
                                },
                                textInputType: TextInputType.phone,
                                hint: '5xxxxxxxx',
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(13.0),
                                  child: Text(
                                    '+966',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),

                              15.height,
                              Text(
                                S.of(context).name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              10.height,
                              MyTextFormField(
                                controller: cubit.nameController,
                                validator: (String? value) {
                                  return null;
                                },
                                hint: S.of(context).writeYourNameHere,
                              ),
                              15.height,
                              Text(
                                S.of(context).email,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              10.height,
                              MyTextFormField(
                                controller: cubit.emailController,
                                validator: (String? value) {
                                  return ValidationClass.validateEmail(
                                    value,
                                    context,
                                  );
                                },
                                textInputType: TextInputType.emailAddress,
                                hint: 'name@example.com',
                              ),
                              15.height,
                              SignUpPolicyText(isAccept: isAccept),
                              15.height,
                              MyButton(
                                title: S.of(context).register,
                                onTap: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    if (isAccept.value) {
                                      cubit.register();
                                    }
                                  }
                                },
                              ),
                              20.height,
                            ],
                          ),
                          if (state.isLoading) const LoadingWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

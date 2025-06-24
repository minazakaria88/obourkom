import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/helpers/validation_inputs_class.dart';
import 'package:oborkom/generated/l10n.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../cubit/login_cubit.dart';
import '../widgets/dont_have_an_account.dart';
import '../widgets/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.loginStatus == LoginStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage ?? 'error')),
              );
            }
            if (state.isSuccess) {
              print('sdfffffffffffffffffffffffffff');
              Navigator.pushNamed(context, Routes.otp);
            }

          },
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();
            return Form(
              key: cubit.formKey,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const LoginHeaderWidget(),
                        Row(
                          children: [
                            10.width,
                            Text(
                              S.of(context).phoneNumber,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        15.height,
                        MyTextFormField(
                          controller: cubit.phoneController,
                          validator: (String? value) {
                            return ValidationClass.validatePhone(value, context);
                          },
                          hint: '5xxxxxxxx',
                          textInputType: TextInputType.phone,
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

                        25.height,
                        MyButton(
                          onTap: () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.login();
                            }
                          },
                          title: S.of(context).enter,
                        ),
                        20.height,
                        const DontHaveAnAccount(),
                      ],
                    ),
                  ),
                  if (state.isLoading)
                    const LoadingWidget(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/functions/show_snack_bar.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/widgets/my_text_form_field.dart';
import 'package:oborkom/core/widgets/validate_widget.dart';
import 'package:oborkom/features/orders/data/models/order_model.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../injection.dart';
import '../cubit/rating_cubit.dart';

class MyRatingWidget extends StatelessWidget {
  MyRatingWidget({super.key, required this.orderDataModel});

  OrderDataModel orderDataModel;

  double rate = 0.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      child: BlocProvider(
        create: (context) => getIt<RatingCubit>(),
        child: BlocConsumer<RatingCubit, RatingState>(
          listener: (context, state) {
            orderDataModel.driverRate = rate.toString();
            if (state.isRateDriverFailure) {
              showToastification(
                message: state.errorMessage ?? '',
                context: context,
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<RatingCubit>();
            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    20.height,
                    const SizedBox(width: double.infinity),
                    SvgPicture.asset(Assets.imagesReview),
                    10.height,
                    !state.isRateDriverSuccess
                        ? Column(
                            children: [
                              Text(
                                S.of(context).delegationEvaluation,
                                style: AppTextStyles.bold18Black,
                              ),
                              10.height,
                              Form(
                                key: cubit.formKey,
                                child: Column(
                                   children: [
                                    ValidateWidget(
                                      validator: () {
                                        if (rate == 0.0) {
                                          return S.of(context).pleaseRateDriver;
                                        }
                                        return null;
                                      },
                                      child: RatingBar.builder(
                                        initialRating: 0,
                                        minRating: 0,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        itemBuilder: (context, _) =>
                                            SvgPicture.asset(
                                              Assets.imagesStarsMinimalistic,
                                            ),
                                        onRatingUpdate: (rating) {
                                          rate = rating;
                                          logger.d(rating);
                                        },
                                      ),
                                    ),
                                    10.height,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: MyTextFormField(
                                        controller: cubit.controller,
                                        hint: S.of(context).comment,
                                        validator: (String? value) {
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Text(
                            S.of(context).thanksForYourReview,
                            style: AppTextStyles.bold18Black,
                          ),

                    10.height,
                    !state.isRateDriverLoading
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Column(
                              children: [
                                state.isRateDriverSuccess
                                    ? Container()
                                    : MyButton(
                                        title: S.of(context).evaluation,
                                        onTap: () {
                                          if (cubit.formKey.currentState!
                                              .validate()) {
                                            cubit.rateDriver(
                                              orderId: orderDataModel.id
                                                  .toString(),
                                              rate: rate.toString(),
                                            );
                                          }
                                        },
                                      ),
                                MyButton(
                                  title: state.isRateDriverSuccess
                                      ? S.of(context).close
                                      : S.of(context).back,
                                  color: AppColors.shadowColor.withAlpha(30),
                                  textColor: Colors.black,
                                  onTap: () {
                                    state.isRateDriverSuccess?
                                    context.popUntil(Routes.home): context.pop(true);
                                  },
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              const CircularProgressIndicator(
                                color: AppColors.mainColor,
                              ),
                              10.height,
                            ],
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

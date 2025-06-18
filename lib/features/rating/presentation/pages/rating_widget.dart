import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../injection.dart';
import '../cubit/rating_cubit.dart';

class MyRatingWidget extends StatefulWidget {
  const MyRatingWidget({super.key});

  @override
  State<MyRatingWidget> createState() => _MyRatingWidgetState();
}

class _MyRatingWidgetState extends State<MyRatingWidget> {
  double rate = 0.0;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      child: BlocProvider(
        create: (context) => getIt<RatingCubit>(),
        child: BlocBuilder<RatingCubit, RatingState>(
          builder: (context, state) {
            final cubit = context.read<RatingCubit>();
            return Container(
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
                  ! state.isRateDriverSuccess
                      ? Column(
                          children: [
                            Text(
                              S.of(context).delegationEvaluation,
                              style: AppTextStyles.bold18Black,
                            ),
                            10.height,
                            RatingBar.builder(
                              initialRating: 0,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              itemBuilder: (context, _) =>
                                  SvgPicture.asset(Assets.imagesStarsMinimalistic),
                              onRatingUpdate: (rating) {
                                rate = rating;
                                logger.d(rating);
                              },
                            ),
                          ],
                        )
                      : Text(
                          S.of(context).thanksForYourReview,
                          style: AppTextStyles.bold18Black,
                        ),

                  10.height,
                 ! state.isRateDriverLoading?  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      children: [

                            state .isRateDriverSuccess ? Container() : MyButton(
                                title: S.of(context).evaluation,
                                onTap: () {
                                  cubit.rateDriver(rate);
                                },
                              ),
                        MyButton(
                          title: state.isRateDriverSuccess ? S.of(context).close:S.of(context).cancel,
                          color: AppColors.shadowColor.withAlpha(30),
                          onTap: () {
                            context.pop();
                          },
                        ),
                      ],
                    ),
                  ) :  Column(
                    children: [
                      const CircularProgressIndicator(
                        color: AppColors.mainColor,
                      ),
                      10.height,
                    ],
                  )

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

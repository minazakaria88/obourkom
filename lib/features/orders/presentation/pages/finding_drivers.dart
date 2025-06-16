import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/widgets/my_app_bar.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/l10n.dart';
import '../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/finding_driver_widgets/order_details_widget.dart';
import '../widgets/finding_driver_widgets/order_timer_widget.dart';

class FindingDriversScreen extends StatelessWidget {
  const FindingDriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).findingDrivers),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          slivers: [
             SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  20.height,
                  const OrderDetailsWidget(),
                  20.height,
                  const OrderTimerWidget(),
                  const Spacer(),
                  const BackgroundProfileWidget(
                    child: Column(
                      children: [

                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<OrdersCubit>().cancelTimer();
                      context.pop();
                    },
                    child: Text(
                      S.of(context).cancelOrder,
                      style: AppTextStyles.regular16Black.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

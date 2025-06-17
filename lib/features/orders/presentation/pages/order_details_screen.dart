import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/widgets/my_text_form_field.dart';
import 'package:oborkom/features/orders/presentation/widgets/order_details_widget/driver_location_widget.dart';
import '../../../../core/helpers/validation_inputs_class.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_app_bar.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/finding_driver_widgets/order_details_widget.dart';
import '../widgets/order_details_widget/order_stepper_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).orderDetails),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          final cubit = context.read<OrdersCubit>();
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderStepperWidget(
                      title: S.of(context).onYourWay,
                      image: Assets.imagesDriverOnWay,
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 100,
                          child: Center(
                            child: DottedLine(alignment: WrapAlignment.center),
                          ),
                        ),
                      ),
                    ),
                    OrderStepperWidget(
                      title: S.of(context).theDriverHasArrived,
                      image: Assets.imagesDriverArrive,
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 100, // Adjust height
                          child: Center(child: DottedLine()),
                        ),
                      ),
                    ),
                    OrderStepperWidget(
                      title: S.of(context).theShipmentHasArrived,
                      image: Assets.imagesShipmentArrive,
                    ),
                  ],
                ),
                20.height,
                const OrderDetailsWidget(),
                20.height,
                const DriverDetails(),
                const Spacer(),
                MyTextFormField(
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppColors.darkMainColor,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(Assets.imagesSendButton),
                    ),
                  ),
                  controller: cubit.messageController,
                  hint: S.of(context).writeYourMessage,
                  validator: (value) => ValidationClass.validateText(
                    value,
                    S.of(context).pleaseWriteYourMessage,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

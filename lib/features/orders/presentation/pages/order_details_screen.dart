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
    final cubit = context.read<OrdersCubit>();
    return Scaffold(
      appBar: MyAppBar(
        title: S.of(context).orderDetails,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.imagesQuestionCircle),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 80,
              ), // space for input field
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: 20.height),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderStepperWidget(
                          title: S.of(context).onYourWay,
                          image: Assets.imagesDriverOnWay,
                        ),
                        const Expanded(
                          child: SizedBox(
                            height: 100,
                            child: Align(
                              alignment: Alignment.center,
                              child: DottedLine(
                                alignment: WrapAlignment.center,
                              ),
                            ),
                          ),
                        ),
                        OrderStepperWidget(
                          title: S.of(context).theDriverHasArrived,
                          image: Assets.imagesDriverArrive,
                        ),
                        const Expanded(
                          child: SizedBox(
                            height: 100,
                            child: Align(
                              alignment: Alignment.center,
                              child: DottedLine(),
                            ),
                          ),
                        ),
                        OrderStepperWidget(
                          title: S.of(context).theShipmentHasArrived,
                          image: Assets.imagesShipmentArrive,
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: 20.height),
                  const SliverToBoxAdapter(child: OrderDetailsWidget()),
                  SliverToBoxAdapter(child: 10.height),
                  const SliverToBoxAdapter(child: DriverDetails()),
                  SliverToBoxAdapter(child: 20.height),
                  // Chat/Message List
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('Message $index'),
                      ),
                      childCount: 10,
                    ),
                  ),
                  SliverToBoxAdapter(child: 20.height),
                ],
              ),
            ),

            // Fixed input at bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: MyTextFormField(
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
            ),
          ],
        ),
      ),
    );
  }
}

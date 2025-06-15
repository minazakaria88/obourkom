import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/utils/app_styles.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/core/widgets/validate_widget.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/new_order_widget/discount_input_widget.dart';
import '../widgets/new_order_widget/new_order_input_widget.dart';
import '../widgets/new_order_widget/notes_input_widget.dart';

class NewOrder extends StatelessWidget {
  const NewOrder({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            height: height * 0.4,
            Assets.imagesNewOrder,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: height * 0.3)),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: BlocBuilder<OrdersCubit, OrdersState>(
                    builder: (context, state) {
                      final cubit = context.read<OrdersCubit>();
                      return Form(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.height,
                            Text(
                              S.of(context).transferServices,
                              style: AppTextStyles.bold18Black,
                            ),
                            20.height,
                            Text(
                              S.of(context).DeterminePickupLocation,
                              style: AppTextStyles.bold14MainColor,
                            ),
                            10.height,
                            ValidateWidget(
                              validator: () {
                                if (state.pickedLocation == null) {
                                  return S
                                      .of(context)
                                      .pleaseEnterPickupLocation;
                                }
                              },
                              child: NewOrderInputWidget(
                                title: S.of(context).pickUpFrom,
                                value: state.pickedLocation == null
                                    ? ''
                                    : state.pickedLocationData!.street,
                                onTap: () async {
                                  final result = await context.pushNamed(
                                    Routes.pickLocation,
                                    arguments: MapContext(type: MapTypes.orderPick),
                                  );
                                  if (result != null) {
                                    logger.e(result);
                                    cubit.pickPickupLocation(result);
                                  }
                                },
                              ),
                            ),
                            30.height,
                            Text(
                              S.of(context).DetermineDeliveryLocation,
                              style: AppTextStyles.bold14MainColor,
                            ),
                            10.height,
                            ValidateWidget(
                              validator: () {
                                if (state.deliveryLocation == null) {
                                  return S
                                      .of(context)
                                      .pleaseEnterDeliveryLocation;
                                }
                              },
                              child: NewOrderInputWidget(
                                title: S.of(context).deliveryTo,
                                value: state.deliveryLocationData == null
                                    ? ''
                                    : state.deliveryLocationData!.street,
                                onTap: () async {
                                  final result = await context.pushNamed(
                                    Routes.pickLocation,
                                    arguments: MapContext(type: MapTypes.orderPick),
                                  );
                                  if (result != null) {
                                    logger.e(result);
                                    cubit.pickDeliveryLocation(result);
                                  }
                                },
                              ),
                            ),
                            20.height,
                            Text(
                              S.of(context).notes,
                              style: AppTextStyles.bold14MainColor,
                            ),
                            10.height,
                            NotesInputWidget(controller: cubit.notesController),
                            20.height,
                            Text(
                              S.of(context).paymentMethod,
                              style: AppTextStyles.bold14MainColor,
                            ),
                            10.height,
                            ValidateWidget(
                              validator: () {
                                if (state.paymentMethod == null) {
                                  return S
                                      .of(context)
                                      .pleaseChoosePaymentMethod;
                                }
                              },
                              child: NewOrderInputWidget(
                                title: 'أبل باي',
                                onTap: () {},
                              ),
                            ),
                            20.height,
                            Text(
                              S.of(context).doYouHaveADiscountCode,
                              style: AppTextStyles.bold14MainColor,
                            ),
                            10.height,
                            DiscountInputWidget(
                              controller: cubit.codeController,
                            ),
                            30.height,
                            Text(
                              S.of(context).expectedTransportationCost,
                              style: AppTextStyles.bold18Black.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            10.height,
                            Text(
                              'من 200 الي 300 ريال',
                              style: AppTextStyles.bold14MainColor.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            10.height,
                            Text(
                              S.of(context).costEstimate,
                              style: AppTextStyles.regular12Grey,
                            ),
                            30.height,
                            MyButton(
                              title: S.of(context).request,
                              onTap: () {
                                if (cubit.formKey.currentState!.validate()) {}
                              },
                            ),
                            20.height,
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

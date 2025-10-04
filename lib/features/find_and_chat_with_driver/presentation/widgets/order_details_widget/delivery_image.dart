import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import '../../../../../generated/l10n.dart';
import '../../../../orders/presentation/widgets/completed_orders_widgets/photo_widget.dart';
import '../../cubit/find_and_chat_with_driver_cubit.dart';

class DeliveryImageWidget extends StatelessWidget {
  const DeliveryImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
        FindAndChatWithDriverCubit,
        FindAndChatWithDriverState
    >(
      buildWhen: (previous, current) =>
      previous.offer != null &&
          previous.offer!.finishedImages !=
              current.offer!.finishedImages,
      builder: (context, state) {
        if (state.offer == null ||
            state.offer!.finishedImages.isNullOrEmpty()) {
          return const SliverToBoxAdapter();
        }
        return SliverToBoxAdapter(
          child: PhotoWidget(
            title: S.of(context).delivered,
            image: state.offer!.finishedImages ?? '',
          ),
        );
      },
    );
  }
}

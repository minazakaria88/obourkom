import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';
import 'package:oborkom/core/helpers/extension.dart';
import '../../../../orders/presentation/widgets/completed_orders_widgets/photo_widget.dart';
import '../../cubit/find_and_chat_with_driver_cubit.dart';


class PickUpImageWidget extends StatelessWidget {
  const PickUpImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
        FindAndChatWithDriverCubit,
        FindAndChatWithDriverState
    >(
      buildWhen: (previous, current) => previous.offer!=current.offer,
      builder: (context, state) {
        if (state.offer == null ||
            state.offer!.processedImages.isNullOrEmpty()) {
          return const SliverToBoxAdapter();
        }
        return SliverToBoxAdapter(
          child: PhotoWidget(
            title: S.of(context).received,
            image: state.offer!.processedImages ?? '',
          ),
        );
      },
    );
  }
}

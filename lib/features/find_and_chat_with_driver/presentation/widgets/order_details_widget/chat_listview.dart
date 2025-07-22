import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/message_model.dart';

import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../cubit/find_and_chat_with_driver_cubit.dart';

class ChatListview extends StatelessWidget {
  const ChatListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindAndChatWithDriverCubit, FindAndChatWithDriverState>(
      buildWhen: (previous, current) => previous.messages != current.messages,
      builder: (context, state) {
        final messages = state.messages ?? [];
        final id = CacheHelper.getData(
          key: CacheHelperKeys.customerId,
        ).toString();
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => id != messages[index].senderId
                ? DriverMessageWidget(messageModel: messages[index])
                : MyMessageWidget(messageModel: messages[index]),
            childCount: messages.length,
          ),
        );
      },
    );
  }
}

class MyMessageWidget extends StatelessWidget {
  const MyMessageWidget({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
        child: Text(
          messageModel.message ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class DriverMessageWidget extends StatelessWidget {
  const DriverMessageWidget({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Text(
          messageModel.message ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

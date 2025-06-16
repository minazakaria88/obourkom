import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/utils/app_colors.dart';
import 'package:oborkom/core/utils/app_styles.dart';
import 'package:oborkom/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:oborkom/generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../widgets/notification_item_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit,NotificationState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if(state.isLoading)
          {
            return const Center(child: CircularProgressIndicator(color: AppColors.mainColor,));
          }
        if(state.isSuccess)
          {
            final list=state.notifications??[];
          return list.isNotEmpty?  Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.separated(
                itemCount: state.notifications!.length,
                separatorBuilder: (context, index) => 30.height,
                itemBuilder: (context, index) => const NotificationItemWidget(),
              ),
            ): Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.imagesNoNotifications),
                15.height,
                Text(S.of(context).noNotifications,style: AppTextStyles.bold18Black,),

              ],
            ));
          }
        return const Text('error');

      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/features/locations/data/models/location_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/locations_cubit.dart';
import 'location_delete_item_widget.dart';
import 'location_edit_item_widget.dart';

class LocationListviewItem extends StatelessWidget {
  const LocationListviewItem({super.key, required this.model});

  final LocationModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop(model);
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: AppColors.shadowColor.withAlpha((0.3 * 255).toInt()),
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          border: model.type != 'home'
              ? null
              : Border.all(width: 1, color: AppColors.mainColor),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(addressToImage[model.type] ?? ''),
                    10.width,
                    Text(
                      model.typeLabel ?? '',
                      style: AppTextStyles.regular12Grey.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                model.type == 'home'
                    ? Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          S.of(context).main,
                          style: AppTextStyles.regular12Grey.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: () {},
                        child: Text(
                          S.of(context).setAsPrimary,
                          style: AppTextStyles.regular12Grey.copyWith(
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                if (model.type != 'home') const LocationItemEditWidget(),
                 LocationItemDeleteWidget(
                   onDelete: (){
                     context.read<LocationsCubit>().deleteLocation(model.id!);
                   },
                 ),
              ],
            ),
            30.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).location, style: AppTextStyles.regular12Grey),
                20.width,
                Flexible(
                  child: Text(
                    model.name ?? '',
                    style: AppTextStyles.regular12Grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

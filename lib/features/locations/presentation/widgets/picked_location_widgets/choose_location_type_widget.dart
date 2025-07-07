import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/helpers/validation_inputs_class.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/my_text_form_field.dart';
import '../../../../../core/widgets/validate_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/location_type_model.dart';
import '../../cubit/locations_cubit.dart';

class ChooseLocationTypeWidget extends StatelessWidget {
  const ChooseLocationTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationsCubit, LocationsState>(
      buildWhen: (previous, current) =>
          previous.locationType != current.locationType,
      builder: (context, state) {
        final cubit = context.read<LocationsCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValidateWidget(
              validator: () {
                if (state.locationType == null) {
                  return S.of(context).pleaseSelectAddressType;
                }
                return null;
              },
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: locationTypes
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          cubit.selectLocationType(e.id);
                        },
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: state.locationType == e.id
                                ? AppColors.mainColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: state.locationType == e.id
                                ? null
                                : Border.all(color: AppColors.mainColor),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                e.image,
                                colorFilter: ColorFilter.mode(
                                  state.locationType == e.id
                                      ? Colors.white
                                      : AppColors.mainColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                              10.width,
                              Text(
                                e.name,
                                style: state.locationType == e.id
                                    ? AppTextStyles.bold14White
                                    : AppTextStyles.regular16Black.copyWith(
                                        fontSize: 12,
                                      ),
                              ),
                              10.width,
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            if (state.locationType == 3) ...[
              10.height,
              Text(S.of(context).label, style: AppTextStyles.bold18Black),
              10.height,
              MyTextFormField(
                controller: cubit.nameController,
                hint: S.of(context).labelHint,
                validator: (String? value) {
                  return ValidationClass.validateText(
                    value,
                    S.of(context).pleaseEnterLabel,
                  );
                },
              ),
            ],
          ],
        );
      },
    );
  }
}

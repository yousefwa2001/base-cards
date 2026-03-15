import 'package:base_cards/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBox extends StatelessWidget {
  final bool? value;
  final void Function(bool?)? onChanged;
  const CustomCheckBox({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18.sp,
      height: 18.sp,
      child: Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        checkColor: AppColors.white,
        activeColor: Colors.transparent,
        side: WidgetStateBorderSide.resolveWith(
          (states) => const BorderSide(color: AppColors.grey),
        ),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}

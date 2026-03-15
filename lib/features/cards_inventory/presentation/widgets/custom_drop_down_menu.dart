import 'package:flutter/material.dart';

import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    required this.title,
    required this.dropdownMenuItems,
    this.onChanged,
  });
  final String title;

  final List<DropdownMenuItem<String>> dropdownMenuItems;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return DropdownButtonFormField<String>(
      initialValue: null,
      isExpanded: true,

      decoration: InputDecoration(
        labelText: title,
        labelStyle: context.medium16(),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lighitGrey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.whiteOut),
        ),
      ),

      hint: Text(t.all, style: context.bold16()),
      dropdownColor: AppColors.black,
      items: [
        DropdownMenuItem(
          value: null,
          child: Text(t.all, style: context.bold16()),
        ),
        ...dropdownMenuItems,
      ],

      onChanged: onChanged,
    );
  }
}

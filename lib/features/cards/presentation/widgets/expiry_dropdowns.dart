import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:base_cards/core/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpiryDropdowns extends StatelessWidget {
  final int? selectedMonth;
  final int? selectedYear;
  final void Function(int? month) onMonthChanged;
  final void Function(int? year) onYearChanged;
  final Color? textColor;
  final Color? dropDownTextColor;
  final bool showNoExpiry;
  final bool noExpiry;
  final void Function()? onNoExpiryChanged;

  const ExpiryDropdowns({
    super.key,
    required this.selectedMonth,
    required this.selectedYear,
    required this.onMonthChanged,
    required this.onYearChanged,
    this.showNoExpiry = false,
    this.noExpiry = false,
    this.onNoExpiryChanged,
    this.textColor,
    this.dropDownTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final years = List<int>.generate(11, (i) => now.year + i);
    final months = List<int>.generate(12, (i) => i + 1);
    final t = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showNoExpiry) ...[
          GestureDetector(
            onTap: onNoExpiryChanged,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(t.no_expiry, style: context.bold14()),
                CustomCheckBox(value: noExpiry),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
        if (!noExpiry)
          Row(
            children: [
              dropDown(
                context: context,
                initialValue: selectedMonth,
                textColor: textColor,
                displayText: (v) => v.toString().padLeft(2, '0'),
                onChanged: onMonthChanged,
                items:
                    months
                        .map(
                          (m) => DropdownMenuItem(
                            value: m,

                            child: Text(
                              m.toString().padLeft(2, '0'),
                              style: context.medium14(
                                color: dropDownTextColor ?? AppColors.whiteOut,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                labelText: t.expiry_month,
                hintText: t.expiry_hint_month,
                validator: (v) {
                  if (noExpiry) return null;
                  if (v == null) return t.error_select_month;
                  if (v < 1 || v > 12) return t.error_invalid_month;
                  return null;
                },
              ),
              SizedBox(width: 12.w),
              dropDown(
                context: context,
                textColor: textColor,
                initialValue: selectedYear,
                labelText: t.expiry_year,
                hintText: t.expiry_hint_year,
                displayText: (v) => v.toString().padLeft(2, '0'),
                onChanged: onYearChanged,
                items:
                    years
                        .map(
                          (y) => DropdownMenuItem(
                            value: y,
                            child: Text(
                              y.toString(),
                              style: context.medium14(
                                color: dropDownTextColor ?? AppColors.whiteOut,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                validator: (v) {
                  if (noExpiry) return null;
                  if (v == null) return t.error_select_year;
                  return null;
                },
              ),
            ],
          ),
      ],
    );
  }

  Expanded dropDown({
    required BuildContext context,
    required String labelText,
    required String hintText,
    required List<DropdownMenuItem<int>>? items,
    String? Function(int?)? validator,
    required Color? textColor,
    required void Function(int?)? onChanged,
    required int? initialValue,
    required String Function(int v) displayText,
  }) {
    return Expanded(
      child: DropdownButtonFormField<int>(
        initialValue: noExpiry ? null : initialValue,
        decoration: InputDecoration(
          labelStyle: context.medium14(color: textColor ?? AppColors.whiteOut),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: textColor ?? AppColors.lighitGrey),
            borderRadius: BorderRadius.circular(20.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.navy),
            borderRadius: BorderRadius.circular(20.r),
          ),
          labelText: labelText,
          hint: Text(hintText, style: context.medium14()),
        ),
        dropdownColor: AppColors.navy,
        items: items,
        onChanged: noExpiry ? null : onChanged,
        validator: validator,

        selectedItemBuilder: (ctx) {
          final list = items ?? [];
          return list.map((item) {
            final v = item.value;
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                v == null ? '' : displayText(v),
                style: context.medium14(
                  color: textColor ?? AppColors.lighitGrey,
                ),
              ),
            );
          }).toList();
        },
      ),
    );
  }
}

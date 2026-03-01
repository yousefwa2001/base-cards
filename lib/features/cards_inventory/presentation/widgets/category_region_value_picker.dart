import 'package:base_cards/core/extensions/user_role_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../card_values/presentation/bloc/card_values_bloc.dart';
import '../../../card_values/presentation/bloc/card_values_event.dart';
import '../../../card_values/presentation/bloc/card_values_state.dart';
import '../../../home/domain/entities/card_category_entity.dart';
import '../../../region/presentation/bloc/region_bloc.dart';
import '../bloc/cards_inventory_bloc.dart';
import 'custom_drop_down_menu.dart';
import 'status_chips.dart';

class CategoryRegionValuePicker extends StatelessWidget {
  const CategoryRegionValuePicker({super.key, required this.categories});

  final List<CardCategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return BlocBuilder<CardsInventoryBloc, CardsInventoryState>(
      builder: (context, invState) {
        final categoryId = invState.category?.id;
        final regionId = invState.region?.id;

        return Column(
          children: [
            SizedBox(height: 12.h),
            // -------- Status Chips --------
            StatusChips(state: invState),
            SizedBox(height: 20.h),
            // -------- Category Dropdown --------
            CustomDropDownMenu(
              title: t.category,
              dropdownMenuItems:
                  categories
                      .map(
                        (c) => DropdownMenuItem(
                          value: c.id,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(c.name, style: context.bold16()),
                              if (!c.isActive)
                                Text(
                                  t.notActive,
                                  style: context.bold16(color: AppColors.red),
                                ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
              onChanged: (v) {
                context.read<CardsInventoryBloc>().add(
                  InventoryCategoryChanged(
                    v != null
                        ? categories.where((element) {
                          return element.id == v;
                        }).toList()[0]
                        : null,
                  ),
                );

                context.read<RegionBloc>().add(
                  LoadRegionsEvent(
                    categoryId: v ?? '',
                    isSupplier: context.isSupplier,
                  ),
                );
              },
            ),

            SizedBox(height: 12.h),

            // -------- Region Dropdown --------
            if (categoryId != null) ...[
              BlocBuilder<RegionBloc, RegionState>(
                builder: (context, state) {
                  if (state is RegionLoaded) {
                    return CustomDropDownMenu(
                      title: t.regions,
                      dropdownMenuItems:
                          state.regions
                              .map(
                                (r) => DropdownMenuItem(
                                  value: r.id,
                                  child: Text(r.name, style: context.bold16()),
                                ),
                              )
                              .toList(),
                      onChanged: (v) {
                        context.read<CardsInventoryBloc>().add(
                          InventoryRegionChanged(
                            v != null
                                ? state.regions.where((element) {
                                  return element.id == v;
                                }).toList()[0]
                                : null,
                          ),
                        );

                        context.read<CardValuesBloc>().add(
                          LoadCardValuesEvent(
                            categoryId: categoryId,
                            regionId: v ?? '',
                            isSupplier: context.isSupplier,
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(height: 12.h),
            ],

            // -------- Values Dropdown --------
            if (regionId != null) ...[
              BlocBuilder<CardValuesBloc, CardValuesState>(
                builder: (context, state) {
                  if (state is CardValuesLoaded) {
                    return CustomDropDownMenu(
                      title: t.cardValue,
                      dropdownMenuItems:
                          state.values
                              .map(
                                (v) => DropdownMenuItem(
                                  value: v.id,
                                  child: Text(
                                    "${v.value}",
                                    style: context.bold16(),
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (v) {
                        context.read<CardsInventoryBloc>().add(
                          InventoryValueChanged(
                            v != null
                                ? state.values.where((element) {
                                  return element.id == v;
                                }).toList()[0]
                                : null,
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(height: 12.h),
            ],
          ],
        );
      },
    );
  }
}

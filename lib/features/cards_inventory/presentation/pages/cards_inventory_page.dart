import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/locator.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/widgets/base_page.dart';
import '../../../card_values/presentation/bloc/card_values_bloc.dart';
import '../../../home/domain/entities/card_category_entity.dart';
import '../../../region/presentation/bloc/region_bloc.dart';
import '../../data/datasources/cards_inventory_remote_data_source.dart';
import '../bloc/cards_inventory_bloc.dart';
import '../widgets/cards_inventory_list_section.dart';
import '../widgets/category_region_value_picker.dart';

@RoutePage()
class CardsInventoryPage extends StatelessWidget implements AutoRouteWrapper {
  final List<CardCategoryEntity> categories;
  const CardsInventoryPage({super.key, required this.categories});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  getIt<CardsInventoryBloc>()..add(
                    const CardsInventoryFetchRequested(
                      status: InventoryStatus.all,
                    ),
                  ),
        ),
        BlocProvider(create: (_) => getIt<RegionBloc>()),
        BlocProvider(create: (_) => getIt<CardValuesBloc>()),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    return BasePage(
      title: t.cardsInventory,
      enableRefresh: true,
      onRefresh:
          () async => context.read<CardsInventoryBloc>().add(
            CardsInventoryFetchRequested(
              status: context.read<CardsInventoryBloc>().state.status,
            ),
          ),
      body: Column(
        children: [
          CategoryRegionValuePicker(categories: categories),
          // -------- List --------
          const CardsInventoryListSection(),
        ],
      ),
    );
  }
}

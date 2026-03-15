import 'package:auto_route/auto_route.dart';
import 'package:base_cards/core/extensions/user_role_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di/locator.dart';
import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/widgets/base_page.dart';
import '../../../../core/widgets/custom_cached_image.dart';
import '../../../home/domain/entities/card_category_entity.dart';
import '../../../region/domain/entities/region_entity.dart';
import '../bloc/card_values_bloc.dart';
import '../bloc/card_values_event.dart';
import '../bloc/card_values_state.dart';
import '../widgets/value_card.dart';

@RoutePage()
class CardValuesPage extends StatelessWidget implements AutoRouteWrapper {
  final CardCategoryEntity category;
  final RegionEntity region;

  const CardValuesPage({
    super.key,
    required this.category,
    required this.region,
  });
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CardValuesBloc>(
          create:
              (_) =>
                  getIt<CardValuesBloc>()..add(
                    LoadCardValuesEvent(
                      categoryId: category.id,
                      regionId: region.id,
                      isSupplier: context.isSupplier,
                    ),
                  ),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: category.name,

      body: BlocBuilder<CardValuesBloc, CardValuesState>(
        builder: (context, state) {
          if (state is CardValuesLoaded) {
            final values = state.values;
            return Column(
              children: [
                CustomCachedImage(
                  imageUrl: region.imageUrl,
                  width: 100,
                  height: 100,
                ),
                ListView.builder(
                  padding: context.paddingAll(16),
                  itemCount: values.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final value = values[index];
                    return ValueCard(
                      value: value,
                      category: category,
                      region: region,
                    );
                  },
                ),
              ],
            );
          } else if (state is CardValuesError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

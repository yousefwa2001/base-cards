import 'package:auto_route/auto_route.dart';
import 'package:base_cards/app/di/locator.dart';
import 'package:base_cards/core/extensions/context_padding_extension.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';

import 'package:base_cards/core/theme/app_colors.dart';
import 'package:base_cards/core/widgets/base_page.dart';
import 'package:base_cards/core/widgets/custom_text_form_field.dart';
import 'package:base_cards/core/widgets/responsive_text.dart';
import 'package:base_cards/features/shops/presentation/bloc/shops_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/shop_card.dart';

@RoutePage()
class ShopsPage extends StatefulWidget implements AutoRouteWrapper {
  const ShopsPage({super.key});

  @override
  State<ShopsPage> createState() => _ShopsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShopsBloc>()..add(const FetchShopsRequested()),
      child: this,
    );
  }
}

class _ShopsPageState extends State<ShopsPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return BasePage(
      title: t.shops,
      enableRefresh: true,
      onRefresh: () async {
        context.read<ShopsBloc>().add(const FetchShopsRequested());
      },
      body: Column(
        children: [
          Padding(
            padding: context.paddingAll(12),
            child: CustomTextField(
              textEditingController: _searchController,
              hintText: t.search,
              onChanged:
                  (v) => context.read<ShopsBloc>().add(ShopsSearchChanged(v)),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: AppColors.lighitGrey.withValues(alpha: .5),
                ),
              ),
            ),
          ),

          BlocBuilder<ShopsBloc, ShopsState>(
            builder: (context, state) {
              if (state is ShopsLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ShopsFailure) {
                return Center(child: ResponsiveText(state.message));
              }

              if (state is ShopsSuccess) {
                final shops = state.filteredShops;

                if (shops.isEmpty) {
                  return Center(child: ResponsiveText(t.noShopsFound));
                }

                return ListView.builder(
                  padding: context.paddingSymmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  itemCount: shops.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final shop = shops[index];
                    return ShopCard(shop: shop);
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

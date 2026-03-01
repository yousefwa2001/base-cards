import 'package:auto_route/auto_route.dart';
import 'package:base_cards/app/di/locator.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:base_cards/core/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/purchase_bloc.dart';
import '../widgets/purchase_history_list.dart';

@RoutePage()
class PurchasePage extends StatelessWidget implements AutoRouteWrapper {
  final String buyerId;
  const PurchasePage({super.key, required this.buyerId});
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<PurchaseBloc>(
      create:
          (_) =>
              getIt<PurchaseBloc>()..add(LoadPurchasesEvent(buyerId: buyerId)),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return BasePage(
      appBar: AppBar(title: Text(t.purchase_history)),
      body: BlocBuilder<PurchaseBloc, PurchaseState>(
        builder: (context, state) {
          if (state is PurchaseLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PurchaseError) {
            return Center(child: Text(state.message));
          }
          if (state is PurchaseLoaded) {
            return PurchaseHistoryList(items: state.purchases);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

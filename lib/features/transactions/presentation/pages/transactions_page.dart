import 'package:auto_route/auto_route.dart';
import 'package:base_cards/app/di/locator.dart';
import 'package:base_cards/core/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/l10n_extension.dart';
import '../bloc/transactions_bloc.dart';
import '../widgets/transactions_list.dart';

@RoutePage()
class TransactionsPage extends StatelessWidget implements AutoRouteWrapper {
  final String shopId;
  const TransactionsPage({super.key, required this.shopId});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TransactionsBloc>(
      create:
          (_) =>
              getIt<TransactionsBloc>()
                ..add(LoadTransactionsEvent(shopId: shopId)),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    return BasePage(
      title: t.transactions,
      body: BlocBuilder<TransactionsBloc, TransactionsState>(
        builder: (context, state) {
          if (state is TransactionsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TransactionsError) {
            return Center(child: Text(state.message));
          }
          if (state is TransactionsLoaded) {
            return TransactionsList(items: state.transactions);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

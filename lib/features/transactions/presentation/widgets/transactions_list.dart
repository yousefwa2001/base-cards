import 'package:base_cards/core/extensions/context_padding_extension.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:base_cards/features/adjust_balance/domain/entities/balance_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'transaction_card.dart';
import 'transaction_date_header.dart';

class TransactionsList extends StatelessWidget {
  final List<BalanceEntity> items;

  const TransactionsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    if (items.isEmpty) return Center(child: Text(t.no_transactions_yet_title));

    // sort newest first
    final List<BalanceEntity> sorted = [...items]..sort((a, b) {
      final ad = a.at ?? DateTime.fromMillisecondsSinceEpoch(0);
      final bd = b.at ?? DateTime.fromMillisecondsSinceEpoch(0);
      return bd.compareTo(ad);
    });

    final groups = _groupByDay(list: sorted, context: context);

    return ListView.builder(
      padding: context.paddingDir(start: 16, top: 12, end: 16, bottom: 24),
      itemCount: groups.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final entry = groups.entries.elementAt(index);
        final title = entry.key;
        final list = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TransactionDateHeader(title: title, count: list.length),
            SizedBox(height: 10.h),
            ...list.map(
              (item) => Padding(
                padding: context.paddingDir(bottom: 12),
                child: TransactionCard(item: item),
              ),
            ),
            SizedBox(height: 8.h),
          ],
        );
      },
    );
  }

  Map<String, List<BalanceEntity>> _groupByDay({
    required List<BalanceEntity> list,
    required BuildContext context,
  }) {
    final Map<String, List<BalanceEntity>> map =
        <String, List<BalanceEntity>>{};
    for (final tx in list) {
      final d = tx.at;
      final key =
          d == null
              ? context.l10n.unknown_date
              : "${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}    ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}   ";

      map.putIfAbsent(key, () => []);
      map[key]!.add(tx);
    }
    return map;
  }
}

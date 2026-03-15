import 'package:base_cards/core/extensions/context_padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/purchase_entity.dart';
import 'purchase_card.dart';
import 'purchase_date_header.dart';
import 'purchase_empty.dart';

class PurchaseHistoryList extends StatelessWidget {
  final List<PurchaseEntity> items;

  const PurchaseHistoryList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const PurchaseEmpty();

    // sort newest first
    final List<PurchaseEntity> sorted = [...items]..sort((a, b) {
      final ad = a.purchasedAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      final bd = b.purchasedAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      return bd.compareTo(ad);
    });

    final groups = _groupByDay(sorted);

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
            PurchaseDateHeader(title: title, count: list.length),
            SizedBox(height: 10.h),
            ...list.map(
              (item) => Padding(
                padding: context.paddingDir(bottom: 12),
                child: PurchaseCard(item: item),
              ),
            ),
            SizedBox(height: 8.h),
          ],
        );
      },
    );
  }

  Map<String, List<PurchaseEntity>> _groupByDay(List<PurchaseEntity> list) {
    final Map<String, List<PurchaseEntity>> map =
        <String, List<PurchaseEntity>>{};
    for (final p in list) {
      final d = p.purchasedAt;
      final key =
          d == null
              ? "Unknown date"
              : "${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";

      map.putIfAbsent(key, () => []);
      map[key]!.add(p);
    }
    return map;
  }
}

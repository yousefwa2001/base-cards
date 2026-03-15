import 'package:base_cards/core/extensions/date_time_extensions.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:base_cards/core/widgets/serial_and_expiries_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../domain/entities/purchase_entity.dart';
import 'purchase_price_chip.dart';
import 'purchase_code_box.dart';
import 'purchase_meta_row.dart';

class PurchaseCard extends StatelessWidget {
  final PurchaseEntity item;

  const PurchaseCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    final theme = Theme.of(context);
    final dt = item.purchasedAt;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top row: Category + Price chip
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(width: 10),
                PurchasePriceChip(price: item.price),
              ],
            ),
            const SizedBox(height: 6),

            // Meta row: Region + Value
            PurchaseMetaRow(
              leftIcon: Icons.public,
              leftText: item.region,
              rightIcon: Icons.confirmation_number_outlined,
              rightText: "${item.value}",
            ),

            const SizedBox(height: 10),

            // Code box with copy
            PurchaseCodeBox(
              code: item.code,
              onCopy: () async {
                await Clipboard.setData(ClipboardData(text: item.code));
                if (context.mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(t.codeCopied)));
                }
              },
            ),

            const SizedBox(height: 10),

            SerialAndExpiriesColumn(
              expiryMonth: item.expiryMonth,
              expiryYear: item.expiryYear,
              serialNumber: item.serialNumber,
            ),
            const SizedBox(height: 10),
            // Bottom row: date/time + optional id
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 6),
                Text(
                  dt == null ? t.purchaseTimeNotAvailable : dt.toYmdHm(),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

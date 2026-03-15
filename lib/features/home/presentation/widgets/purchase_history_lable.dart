import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/locator.dart';
import '../../../../app/router/app_router.gr.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/storage/secure_storage_api.dart';
import '../../../../core/widgets/icon_label.dart';

class PurchaseHistoryLable extends StatelessWidget {
  const PurchaseHistoryLable({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return IconLabel(
      icon: const Icon(Icons.book_outlined),
      text: t.purchase_history,

      onTap: () async {
        final buyerId = await getIt<SecureStorageApi>().getUid();
        if (buyerId == null || buyerId.isEmpty) return;
        context.router.push(PurchaseRoute(buyerId: buyerId));
      },
    );
  }
}

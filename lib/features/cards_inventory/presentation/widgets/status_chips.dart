import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/l10n_extension.dart';
import '../../data/datasources/cards_inventory_remote_data_source.dart';
import '../bloc/cards_inventory_bloc.dart';

class StatusChips extends StatelessWidget {
  const StatusChips({super.key, required this.state});

  final CardsInventoryState state;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Wrap(
      spacing: 8.w,
      children: [
        ChoiceChip(
          label: Text(t.all),
          selected: state.status == InventoryStatus.all,
          onSelected: (_) {
            context.read<CardsInventoryBloc>().add(
              const InventoryStatusChanged(status: InventoryStatus.all),
            );
          },
        ),
        ChoiceChip(
          label: Text(t.available),
          selected: state.status == InventoryStatus.available,
          onSelected: (_) {
            context.read<CardsInventoryBloc>().add(
              const InventoryStatusChanged(status: InventoryStatus.available),
            );
          },
        ),
        ChoiceChip(
          label: Text(t.sold),
          selected: state.status == InventoryStatus.sold,
          onSelected: (_) {
            context.read<CardsInventoryBloc>().add(
              const InventoryStatusChanged(status: InventoryStatus.sold),
            );
          },
        ),
      ],
    );
  }
}

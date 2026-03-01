import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/enums/balance_direction.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../bloc/adjust_balance_bloc.dart';
import 'type_button.dart';

class TypeRow extends StatelessWidget {
  const TypeRow({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    return BlocBuilder<AdjustBalanceBloc, AdjustBalanceState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: TypeButton(
                selected: state.direction == BalanceDirection.credit,
                text: t.addBalance,
                icon: Icons.add,
                onTap:
                    () => context.read<AdjustBalanceBloc>().add(
                      const EditBalanceDirection(
                        direction: BalanceDirection.credit,
                      ),
                    ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: TypeButton(
                selected: state.direction == BalanceDirection.debit,
                text: t.deductBalance,
                icon: Icons.remove,
                onTap:
                    () => context.read<AdjustBalanceBloc>().add(
                      const EditBalanceDirection(
                        direction: BalanceDirection.debit,
                      ),
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}


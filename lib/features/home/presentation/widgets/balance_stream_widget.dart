import 'package:base_cards/core/extensions/context_padding_extension.dart';
import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:base_cards/core/utils/money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/l10n_extension.dart';
import '../blocs/balanc_cubit/balance_cubit.dart';

class BalanceStreamWidget extends StatelessWidget {
  const BalanceStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Container(
      width: double.infinity,
      padding: context.paddingAll(20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white),

        borderRadius: BorderRadius.circular(20.r),
      ),
      child: BlocBuilder<BalanceCubit, BalanceState>(
        builder: (context, state) {
          if (state is BalanceLoading || state is BalanceInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BalanceLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                Text("${t.balance} :", style: context.medium20()),
                Text(
                  " ${Money.toMajor(state.balance)} JOD",
                  style: context.bold16().copyWith(fontSize: 25.sp),
                ),
              ],
            );
          } else if (state is BalanceError) {
            return Text(
              state.message,
              style: context.medium14(color: Colors.red),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

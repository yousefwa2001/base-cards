import 'package:auto_route/auto_route.dart';
import 'package:base_cards/app/di/locator.dart';
import 'package:base_cards/core/enums/balance_direction.dart';
import 'package:base_cards/core/utils/money.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/dialogs/show_error_dialog.dart';
import '../../../../core/dialogs/show_success_dialog.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/widgets/base_page.dart';
import '../../../../core/widgets/custom_button.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../bloc/adjust_balance_bloc.dart';
import '../widgets/adjust_balance_form.dart';

@RoutePage()
class AdjustBalancePage extends StatefulWidget implements AutoRouteWrapper {
  final UserEntity shop;

  const AdjustBalancePage({super.key, required this.shop});

  @override
  State<AdjustBalancePage> createState() => _AdjustBalancePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => getIt<AdjustBalanceBloc>(), child: this);
  }
}

class _AdjustBalancePageState extends State<AdjustBalancePage> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    return BlocListener<AdjustBalanceBloc, AdjustBalanceState>(
      listener: (context, state) {
        if (state is AdjustBalanceSuccess) {
          showSuccessDialog(
            context: context,
            message: t.done,
            onOk: () {
              if (!context.mounted) return;
              context.router.pop(true);
            },
          );
        } else if (state is AdjustBalanceError) {
          showErrorDialog(context: context, message: state.message);
        }
      },
      child: Stack(
        children: [
          BasePage(
            title: t.adjustBalance,
            body: AdjustBalanceForm(
              shop: widget.shop,
              amountController: amountController,
              noteController: noteController,
            ),
          ),
          Positioned(
            bottom: 30.h,
            right: 25.w,
            child: BlocBuilder<AdjustBalanceBloc, AdjustBalanceState>(
              builder: (context, state) {
                return CustomButton(
                  text:
                      state.direction == BalanceDirection.credit
                          ? t.addBalance
                          : t.deductBalance,
                  isLoading: state is AdjustBalanceLoading,
                  onPressed: () {
                    final amountMinor = Money.parseToMinor(
                      amountController.text,
                    );
                    if (amountMinor <= 0) {
                      showErrorDialog(
                        context: context,
                        message: t.invalidAmount,
                      );
                      return;
                    }

                    final note = noteController.text.trim();
                    context.read<AdjustBalanceBloc>().add(
                      AdjustBalanceRequested(
                        shopId: widget.shop.uid,
                        amount: amountMinor,
                        direction: state.direction.value,
                        note: note.isEmpty ? null : note,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

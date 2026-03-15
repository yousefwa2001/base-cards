import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dialogs/show_confirm_dialog.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/icon_label.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class LogoutLable extends StatelessWidget {
  const LogoutLable({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return IconLabel(
      icon: const Icon(Icons.logout),
      text: t.logout,
      onTap: () async {
        final bool confirm = await showConfirmDialog(
          context: context,
          title: t.logoutConfirmTitle,
          message: t.logoutConfirmMessage,
          confirmText: t.logout,
          color: AppColors.red,
        );

        if (confirm == true) {
          context.read<AuthBloc>().add(const LogoutRequested());
        }
      },
    );
  }
}

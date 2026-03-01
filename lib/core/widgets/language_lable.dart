import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dialogs/show_confirm_dialog.dart';
import '../localization/locale_cubit.dart';
import 'icon_label.dart';

class LanguageLable extends StatelessWidget {
  final TextStyle? style;
  const LanguageLable({super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return IconLabel(
      icon: const Icon(Icons.translate),
      text: t.theLanguage,
      style: style,

      onTap: () async {
        final bool confirm = await showConfirmDialog(
          context: context,
          title: t.languageChangeTitle,
          message: t.languageChangeMessage,
          confirmText: t.changeLanguage,
        );

        if (confirm == true) {
          context.read<LocaleCubit>().toggleLocale();
        }
      },
    );
  }
}

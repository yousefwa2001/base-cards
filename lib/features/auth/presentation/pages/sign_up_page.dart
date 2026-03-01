import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/app_router.gr.dart';
import '../../../../core/dialogs/show_error_dialog.dart';
import '../../../../core/utils/firebase_error_mapper.dart';
import '../../../../core/utils/logger.dart';
import '../../../../core/widgets/base_page.dart';
import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/language_lable.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/sign_up_form.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    return BasePage(
      appBar: AppBar(
        actions: [
          Padding(
            padding: context.paddingDir(end: 20),
            child: LanguageLable(
              style: context.bold16(color: AppColors.whiteOut),
            ),
          ),
        ],
        title: Text(t.signUpTitle),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            context.router.replace(const HomeRoute());
          } else if (state is EmailNotVerified) {
            context.router.replace(const VerifyEmailRoute());
          } else if (state is AuthError) {
            AppLogger.warn(state.message);
            final message = mapFirebaseErrorToMessage(state.message, t);
            showErrorDialog(context: context, message: message);
          }
        },
        child: const SignUpForm(),
      ),
    );
  }
}

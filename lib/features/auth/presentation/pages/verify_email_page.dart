import 'package:auto_route/auto_route.dart';
import 'package:base_cards/core/dialogs/show_success_dialog.dart';

import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:base_cards/core/widgets/base_page.dart';
import 'package:base_cards/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/router/app_router.gr.dart';
import '../../../../core/dialogs/show_confirm_dialog.dart';
import '../../../../core/dialogs/show_error_dialog.dart';
import '../../../../core/utils/firebase_error_mapper.dart';
import '../../../../core/utils/logger.dart';
import '../bloc/auth_bloc.dart';

@RoutePage()
class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    return BasePage(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            AppLogger.warn(state.message);
            final message = mapFirebaseErrorToMessage(state.message, t);
            showErrorDialog(context: context, message: message);
          } else if (state is VerificationEmailSent) {
            showSuccessDialog(
              context: context,
              message: t.verificationEmailSentMessage,
            );
          } else if (state is RecheckEmailNotVerified) {
            showErrorDialog(
              context: context,
              message: t.emailStillNotVerifiedMessage,
            );
          } else if (state is Authenticated) {
            context.router.replace(const HomeRoute());
          } else if (state is Unauthenticated) {
            context.router.replace(const LoginRoute());
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 100.h),
            Text(
              t.verifyEmailHeadline,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 60.h),
            SizedBox(height: 10.h),
            Text(t.verifyEmailBody, style: TextStyle(fontSize: 14.sp)),
            SizedBox(height: 24.h),

            // Resend
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                final loading = state is AuthLoading;
                return CustomButton(
                  isLoading: loading,
                  text: t.resendVerificationEmail,
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      const SendVerificationEmailRequested(),
                    );
                  },
                );
              },
            ),

            SizedBox(height: 12.h),

            // I verified
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                final loading = state is AuthLoading;
                return CustomButton(
                  isLoading: loading,
                  text: t.iVerified,
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      const RecheckEmailVerificationRequested(),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 40.h),
            CustomButton(
              backgroundColor: AppColors.red,
              onPressed: () async {
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
              text: t.logout,
            ),
          ],
        ),
      ),
    );
  }
}

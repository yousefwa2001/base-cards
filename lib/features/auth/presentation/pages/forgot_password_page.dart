import 'package:auto_route/auto_route.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_validation.dart';
import '../../../../core/dialogs/show_error_dialog.dart';
import '../../../../core/utils/firebase_error_mapper.dart';
import '../../../../core/widgets/base_page.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../bloc/auth_bloc.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    return BasePage(
      appBar: AppBar(title: Text(t.forgotPasswordTitle)),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is PasswordResetEmailSent) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(t.resetEmailSent)));
            context.router.pop();
          } else if (state is AuthError) {
            final msg = mapFirebaseErrorToMessage(state.message, t);
            showErrorDialog(context: context, message: msg);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  textEditingController: _emailController,
                  label: t.email,
                  hintText: t.email,
                  validator: (email) {
                    if (email == null || email.isEmpty) return t.emptyEmail;
                    if (!AppValidation.emailRegex.hasMatch(email.trim())) {
                      return t.invalidEmail;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state is AuthLoading,
                      text: t.sendResetLink,
                      onPressed: () {
                        final ok = _formKey.currentState!.validate();
                        if (!ok) return;

                        context.read<AuthBloc>().add(
                          ForgotPasswordRequested(email: _emailController.text),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

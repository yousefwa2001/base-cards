import 'package:auto_route/auto_route.dart';
import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/router/app_router.gr.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_validation.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../bloc/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    context.read<AuthBloc>().add(
      LoginRequested(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Center(child: Image.asset(AppImages.logo, height: 200.sp)),

          // Email Field
          CustomTextField(
            textEditingController: emailController,
            label: t.email,
            hintText: t.email,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
            validator: (email) {
              if (email == null || email.isEmpty) return t.emptyEmail;
              if (!AppValidation.emailRegex.hasMatch(email.trim())) {
                return t.invalidEmail;
              }
              return null;
            },
          ),

          SizedBox(height: 20.h),

          // Password Field
          CustomTextField(
            focusNode: passwordFocusNode,
            textEditingController: passwordController,
            obscureText: true,
            label: t.password,
            hintText: t.password,
            onFieldSubmitted: (_) => _submit(),
            validator: (password) {
              if (password == null || password.length < 6) {
                return t.shortPassword;
              }
              return null;
            },
          ),

          SizedBox(height: 50.h),

          // Login Button
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AuthLoading,
                onPressed: _submit,
                text: t.loginButton,
              );
            },
          ),

          SizedBox(height: 14.h),

          // Create Account
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => context.router.replace(const SignUpRoute()),
                child: Text(t.createAccount, style: context.medium14()),
              ),
              TextButton(
                onPressed:
                    () => context.router.push(const ForgotPasswordRoute()),
                child: Text(t.forgotPassword, style: context.medium14()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

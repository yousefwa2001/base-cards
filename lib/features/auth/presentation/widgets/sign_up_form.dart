import 'package:auto_route/auto_route.dart';
import 'package:base_cards/app/router/app_router.gr.dart';
import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_validation.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../bloc/auth_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Name
          CustomTextField(
            textEditingController: nameController,
            label: t.name,
            hintText: t.name,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(emailFocusNode);
            },
            validator: (name) {
              if (name == null || name.trim().isEmpty) {
                return t.required;
              }
              if (name.trim().length < 2) {
                return t.invalidName;
              }
              return null;
            },
          ),

          SizedBox(height: 20.h),

          // Email
          CustomTextField(
            focusNode: emailFocusNode,
            textEditingController: emailController,
            label: t.email,
            hintText: t.email,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
            validator: (email) {
              if (email == null || email.isEmpty) {
                return t.emptyEmail;
              }
              if (!AppValidation.emailRegex.hasMatch(email.trim())) {
                return t.invalidEmail;
              }
              return null;
            },
          ),

          SizedBox(height: 20.h),

          // Password
          CustomTextField(
            focusNode: passwordFocusNode,
            textEditingController: passwordController,
            obscureText: true,
            label: t.password,
            hintText: t.password,
            onFieldSubmitted: (_) => _submit(context),
            validator: (password) {
              if (password == null || password.length < 6) {
                return t.shortPassword;
              }
              return null;
            },
          ),

          SizedBox(height: 50.h),

          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AuthLoading,
                onPressed: () => _submit(context),
                text: t.createAccount,
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(t.alreadyHaveAccountQuestion),
              TextButton(
                onPressed: () => context.router.replace(const LoginRoute()),
                child: Text(context.l10n.signIn, style: context.medium14()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submit(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    context.read<AuthBloc>().add(
      RegisterRequested(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
  }
}

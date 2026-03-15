import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:base_cards/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/router/app_router.gr.dart';
import '../bloc/auth_bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  static const _minSplash = Duration(seconds: 2);

  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  late final DateTime _startTime;

  @override
  void initState() {
    super.initState();

    _startTime = DateTime.now();

    _controller = AnimationController(vsync: this, duration: _minSplash);
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    context.read<AuthBloc>().add(const AuthStarted());
  }

  Future<void> _go(PageRouteInfo route) async {
    final elapsed = DateTime.now().difference(_startTime);
    final remaining = _minSplash - elapsed;

    if (remaining > Duration.zero) {
      await Future.delayed(remaining);
    }
    if (!mounted) return;

    context.router.replaceAll([route]);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen:
            (prev, curr) =>
                curr is Authenticated ||
                curr is Unauthenticated ||
                curr is EmailNotVerified,
        listener: (context, state) {
          if (state is Authenticated) {
            _go(const HomeRoute());
          } else if (state is EmailNotVerified) {
            _go(const VerifyEmailRoute());
          } else if (state is Unauthenticated) {
            _go(const LoginRoute());
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1E1E2C), Color(0xFF2D2D44)],
            ),
          ),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Center(child: Image.asset(AppImages.logo, height: 250.sp)),
          ),
        ),
      ),
    );
  }
}

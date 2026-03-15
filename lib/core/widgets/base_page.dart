import 'package:base_cards/core/extensions/context_padding_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasePage extends StatelessWidget {
  final String? title;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floating;
  final EdgeInsetsGeometry? padding;
  final bool useSafeArea;
  final bool centerTitle;
  final double? topPadding;
  final double? leftPadding;
  final double? rightPadding;
  final double? bottomPadding;
  final Widget? drawer;

  final Future<void> Function()? onRefresh;
  final bool enableRefresh;

  const BasePage({
    super.key,
    this.title,
    this.appBar,
    required this.body,
    this.floating,
    this.padding,
    this.useSafeArea = false,
    this.centerTitle = true,
    this.topPadding,
    this.leftPadding,
    this.rightPadding,
    this.bottomPadding,
    this.drawer,
    this.onRefresh,
    this.enableRefresh = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectivePadding =
        padding ??
        context.paddingDir(
          top: (topPadding ?? 16.0).r,
          start: (leftPadding ?? 20.0).r,
          end: (rightPadding ?? 20.0).r,
          bottom: (bottomPadding ?? 0.0).r,
        );

    Widget content = SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(padding: effectivePadding, child: body),
    );

    if (enableRefresh && onRefresh != null) {
      content = RefreshIndicator(onRefresh: onRefresh!, child: content);
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.towInGradiant,
            AppColors.secondary,
          ],
        ),
      ),
      child: Scaffold(
        appBar: appBar ?? (title != null ? AppBar(title: Text(title!)) : null),
        drawer: drawer,
        backgroundColor: Colors.transparent,
        body:
            useSafeArea
                ? SafeArea(child: content)
                : SafeArea(bottom: true, top: false, child: content),
        floatingActionButton: floating,
      ),
    );
  }
}

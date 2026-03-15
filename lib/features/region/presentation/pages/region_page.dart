import 'package:auto_route/auto_route.dart';
import 'package:base_cards/app/router/app_router.gr.dart';
import 'package:base_cards/core/extensions/context_padding_extension.dart';
import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/extensions/user_role_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';

import 'package:base_cards/core/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/di/locator.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/widgets/custom_cached_image.dart';
import '../../../home/domain/entities/card_category_entity.dart';
import '../bloc/region_bloc.dart';

@RoutePage()
class RegionPage extends StatelessWidget implements AutoRouteWrapper {
  final CardCategoryEntity category;
  const RegionPage({super.key, required this.category});
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegionBloc>(
          create:
              (_) =>
                  getIt<RegionBloc>()..add(
                    LoadRegionsEvent(
                      categoryId: category.id,
                      isSupplier: context.isSupplier,
                    ),
                  ),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return BasePage(
      title: t.regions,
      body: BlocBuilder<RegionBloc, RegionState>(
        builder: (context, state) {
          if (state is RegionLoaded) {
            final regions = state.regions;
            return Column(
              spacing: 20.h,
              children: [
                CustomCachedImage(
                  imageUrl: category.imageUrl,
                  width: 60.sp,
                  height: 60.sp,
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                  ),

                  itemCount: regions.length,

                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final region = regions[index];
                    return GestureDetector(
                      onTap: () {
                        context.router.push(
                          CardValuesRoute(category: category, region: region),
                        );
                      },
                      child: Container(
                        padding: context.paddingDir(top: 23),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.white.withValues(alpha: .08),
                              blurRadius: 30,
                              spreadRadius: -10,
                              offset: const Offset(0, -10),
                            ),
                          ],

                          color: const Color.fromARGB(48, 126, 121, 121),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: .22),
                            width: 1.2,
                          ),
                        ),

                        child: Column(
                          spacing: 10.h,
                          children: [
                            Stack(
                              children: [
                                CustomCachedImage(
                                  imageUrl: region.imageUrl,
                                  width: 80,
                                  height: 80,
                                ),
                                if (!region.isActive)
                                  Positioned(
                                    top: 1.sp,
                                    child: Icon(
                                      Icons.close,
                                      color: AppColors.red,
                                      size: 80.sp,
                                    ),
                                  ),
                              ],
                            ),

                            Text(
                              region.name,
                              style: context.bold16(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (state is RegionLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.white),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

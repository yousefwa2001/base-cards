import 'package:auto_route/auto_route.dart';
import 'package:base_cards/core/extensions/user_role_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/di/locator.dart';
import '../../../../app/router/app_router.gr.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/widgets/base_page.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../blocs/balanc_cubit/balance_cubit.dart';
import '../blocs/home_bloc/home_bloc.dart';
import '../blocs/user_name_cubit/user_name_cubit.dart';
import '../widgets/balance_stream_widget.dart';
import '../widgets/categories.dart';
import '../widgets/home_drawer.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BalanceCubit>(
          create: (_) => getIt<BalanceCubit>()..start(),
        ),
        BlocProvider(
          create:
              (_) =>
                  getIt<HomeBloc>()
                    ..add(LoadCategoriesEvent(isSupplier: context.isSupplier)),
        ),
        BlocProvider(create: (_) => getIt<UserNameCubit>()..load()),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.router.replace(const LoginRoute());
        }
      },
      child: BasePage(
        enableRefresh: true,
        onRefresh: () async {
          context.read<UserNameCubit>().load();
          context.read<HomeBloc>().add(
            LoadCategoriesEvent(isSupplier: context.isSupplier),
          );
        },
        topPadding: 0,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 110.h,
          title: Image.asset(AppImages.logo, height: 150.sp),
        ),
        drawer: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is CategoriesLoaded) {
              return Padding(
                padding: context.paddingSymmetric(vertical: 30.0),
                child: HomeDrawer(categories: state.categories),
              );
            } else if (state is CategoriesLoading) {
              return const CircularProgressIndicator();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20.h,
          children: [
            const BalanceStreamWidget(),

            Text(t.categories, style: context.medium20()),
            const Categories(),
          ],
        ),
      ),
    );
  }
}

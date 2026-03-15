import 'package:base_cards/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/di/locator.dart';
import 'app/router/app_router.dart';
import 'core/localization/locale_cubit.dart';
import 'core/storage/secure_storage_api.dart';
import 'core/theme/app_theme.dart';
import 'l10n/generated/app_localizations.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.initialLocale});

  final Locale initialLocale;
  final AppRouter _router = AppRouter();
  final SecureStorageApi secureStorage = getIt<SecureStorageApi>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(384, 823),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          // 🌍 Localization
          BlocProvider<LocaleCubit>(
            create:
                (_) => LocaleCubit(
                  initialLocale: initialLocale,
                  storage: secureStorage,
                ),
          ),
          // 🔐 Auth
          BlocProvider<AuthBloc>(create: (_) => getIt<AuthBloc>()),
        ],
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (localeContext, locale) {
            final bool isArabic = locale.languageCode == 'ar';

            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Cards App',
              theme: AppTheme.build(isArabic: isArabic),
              locale: locale,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              routerConfig: _router.config(),
            );
          },
        ),
      ),
    );
  }
}

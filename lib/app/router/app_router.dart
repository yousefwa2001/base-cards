import 'package:auto_route/auto_route.dart';
import 'package:base_cards/app/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: SplashRoute.page,
      path: '/splash',
      initial: true,
      reverseDuration: const Duration(microseconds: 0),
      duration: const Duration(microseconds: 0),
    ),
    CustomRoute(
      page: LoginRoute.page,
      path: '/login',
      reverseDuration: const Duration(microseconds: 0),
      duration: const Duration(microseconds: 0),
    ),

    CustomRoute(
      page: SignUpRoute.page,
      path: '/signUp',
      reverseDuration: const Duration(microseconds: 0),
      duration: const Duration(microseconds: 0),
    ),
    CustomRoute(
      page: VerifyEmailRoute.page,
      path: '/VerifyEmail',
      reverseDuration: const Duration(microseconds: 0),
      duration: const Duration(microseconds: 0),
    ),
    CustomRoute(
      page: ForgotPasswordRoute.page,
      path: '/ForgotPassword',
      reverseDuration: const Duration(microseconds: 0),
      duration: const Duration(microseconds: 0),
    ),
    CustomRoute(
      page: HomeRoute.page,
      path: '/home',
      reverseDuration: const Duration(microseconds: 0),
      duration: const Duration(microseconds: 0),
    ),
    CustomRoute(
      page: CardValuesRoute.page,
      path: '/card-values',
      reverseDuration: const Duration(microseconds: 0),
      duration: const Duration(microseconds: 0),
    ),
    CustomRoute(
      page: RegionRoute.page,
      path: '/region',
      reverseDuration: const Duration(microseconds: 0),
      duration: const Duration(microseconds: 0),
    ),
    CustomRoute(
      page: AddCardRoute.page,
      path: '/addCard',
      reverseDuration: const Duration(microseconds: 0),
      duration: const Duration(microseconds: 0),
    ),
    CustomRoute(
      page: PurchaseRoute.page,
      path: '/purchase',
      reverseDuration: const Duration(microseconds: 0),
      duration: const Duration(microseconds: 0),
    ),
    CustomRoute(
      page: CardsInventoryRoute.page,
      path: '/cardsInventor',
      reverseDuration: const Duration(microseconds: 0),
      duration: const Duration(microseconds: 0),
    ),
    CustomRoute(
      page: ShopsRoute.page,
      path: '/Shops',
      reverseDuration: const Duration(microseconds: 0),
      duration: const Duration(microseconds: 0),
    ),
    CustomRoute(
      page: AdjustBalanceRoute.page,
      path: '/AdjustBalance',
      reverseDuration: const Duration(microseconds: 0),
      duration: const Duration(microseconds: 0),
    ),
  ];
}

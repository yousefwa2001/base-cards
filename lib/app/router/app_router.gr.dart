// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:base_cards/features/adjust_balance/presentation/pages/adjust_balance_page.dart'
    as _i2;
import 'package:base_cards/features/auth/domain/entities/user_entity.dart'
    as _i19;
import 'package:base_cards/features/auth/presentation/pages/forgot_password_page.dart'
    as _i5;
import 'package:base_cards/features/auth/presentation/pages/login_screen.dart'
    as _i7;
import 'package:base_cards/features/auth/presentation/pages/sign_up_page.dart'
    as _i11;
import 'package:base_cards/features/auth/presentation/pages/splash_screen.dart'
    as _i12;
import 'package:base_cards/features/auth/presentation/pages/verify_email_page.dart'
    as _i13;
import 'package:base_cards/features/card_values/domain/entities/card_value_entity.dart'
    as _i18;
import 'package:base_cards/features/card_values/presentation/pages/card_values_page.dart'
    as _i3;
import 'package:base_cards/features/cards/presentation/pages/add_card.dart'
    as _i1;
import 'package:base_cards/features/cards_inventory/presentation/pages/cards_inventory_page.dart'
    as _i4;
import 'package:base_cards/features/home/domain/entities/card_category_entity.dart'
    as _i16;
import 'package:base_cards/features/home/presentation/pages/home_page.dart'
    as _i6;
import 'package:base_cards/features/purchase/presentation/pages/purchase_page.dart'
    as _i8;
import 'package:base_cards/features/region/domain/entities/region_entity.dart'
    as _i17;
import 'package:base_cards/features/region/presentation/pages/region_page.dart'
    as _i9;
import 'package:base_cards/features/shops/presentation/pages/shops_page.dart'
    as _i10;
import 'package:collection/collection.dart' as _i20;
import 'package:flutter/material.dart' as _i15;

/// generated route for
/// [_i1.AddCardPage]
class AddCardRoute extends _i14.PageRouteInfo<AddCardRouteArgs> {
  AddCardRoute({
    _i15.Key? key,
    required _i16.CardCategoryEntity category,
    required _i17.RegionEntity region,
    required _i18.CardValueEntity value,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         AddCardRoute.name,
         args: AddCardRouteArgs(
           key: key,
           category: category,
           region: region,
           value: value,
         ),
         initialChildren: children,
       );

  static const String name = 'AddCardRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddCardRouteArgs>();
      return _i14.WrappedRoute(
        child: _i1.AddCardPage(
          key: args.key,
          category: args.category,
          region: args.region,
          value: args.value,
        ),
      );
    },
  );
}

class AddCardRouteArgs {
  const AddCardRouteArgs({
    this.key,
    required this.category,
    required this.region,
    required this.value,
  });

  final _i15.Key? key;

  final _i16.CardCategoryEntity category;

  final _i17.RegionEntity region;

  final _i18.CardValueEntity value;

  @override
  String toString() {
    return 'AddCardRouteArgs{key: $key, category: $category, region: $region, value: $value}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AddCardRouteArgs) return false;
    return key == other.key &&
        category == other.category &&
        region == other.region &&
        value == other.value;
  }

  @override
  int get hashCode =>
      key.hashCode ^ category.hashCode ^ region.hashCode ^ value.hashCode;
}

/// generated route for
/// [_i2.AdjustBalancePage]
class AdjustBalanceRoute extends _i14.PageRouteInfo<AdjustBalanceRouteArgs> {
  AdjustBalanceRoute({
    _i15.Key? key,
    required _i19.UserEntity shop,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         AdjustBalanceRoute.name,
         args: AdjustBalanceRouteArgs(key: key, shop: shop),
         initialChildren: children,
       );

  static const String name = 'AdjustBalanceRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AdjustBalanceRouteArgs>();
      return _i2.AdjustBalancePage(key: args.key, shop: args.shop);
    },
  );
}

class AdjustBalanceRouteArgs {
  const AdjustBalanceRouteArgs({this.key, required this.shop});

  final _i15.Key? key;

  final _i19.UserEntity shop;

  @override
  String toString() {
    return 'AdjustBalanceRouteArgs{key: $key, shop: $shop}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AdjustBalanceRouteArgs) return false;
    return key == other.key && shop == other.shop;
  }

  @override
  int get hashCode => key.hashCode ^ shop.hashCode;
}

/// generated route for
/// [_i3.CardValuesPage]
class CardValuesRoute extends _i14.PageRouteInfo<CardValuesRouteArgs> {
  CardValuesRoute({
    _i15.Key? key,
    required _i16.CardCategoryEntity category,
    required _i17.RegionEntity region,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         CardValuesRoute.name,
         args: CardValuesRouteArgs(
           key: key,
           category: category,
           region: region,
         ),
         initialChildren: children,
       );

  static const String name = 'CardValuesRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CardValuesRouteArgs>();
      return _i14.WrappedRoute(
        child: _i3.CardValuesPage(
          key: args.key,
          category: args.category,
          region: args.region,
        ),
      );
    },
  );
}

class CardValuesRouteArgs {
  const CardValuesRouteArgs({
    this.key,
    required this.category,
    required this.region,
  });

  final _i15.Key? key;

  final _i16.CardCategoryEntity category;

  final _i17.RegionEntity region;

  @override
  String toString() {
    return 'CardValuesRouteArgs{key: $key, category: $category, region: $region}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CardValuesRouteArgs) return false;
    return key == other.key &&
        category == other.category &&
        region == other.region;
  }

  @override
  int get hashCode => key.hashCode ^ category.hashCode ^ region.hashCode;
}

/// generated route for
/// [_i4.CardsInventoryPage]
class CardsInventoryRoute extends _i14.PageRouteInfo<CardsInventoryRouteArgs> {
  CardsInventoryRoute({
    _i15.Key? key,
    required List<_i16.CardCategoryEntity> categories,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         CardsInventoryRoute.name,
         args: CardsInventoryRouteArgs(key: key, categories: categories),
         initialChildren: children,
       );

  static const String name = 'CardsInventoryRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CardsInventoryRouteArgs>();
      return _i14.WrappedRoute(
        child: _i4.CardsInventoryPage(
          key: args.key,
          categories: args.categories,
        ),
      );
    },
  );
}

class CardsInventoryRouteArgs {
  const CardsInventoryRouteArgs({this.key, required this.categories});

  final _i15.Key? key;

  final List<_i16.CardCategoryEntity> categories;

  @override
  String toString() {
    return 'CardsInventoryRouteArgs{key: $key, categories: $categories}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CardsInventoryRouteArgs) return false;
    return key == other.key &&
        const _i20.ListEquality<_i16.CardCategoryEntity>().equals(
          categories,
          other.categories,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i20.ListEquality<_i16.CardCategoryEntity>().hash(categories);
}

/// generated route for
/// [_i5.ForgotPasswordPage]
class ForgotPasswordRoute extends _i14.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i14.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return _i14.WrappedRoute(child: const _i6.HomePage());
    },
  );
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.LoginPage();
    },
  );
}

/// generated route for
/// [_i8.PurchasePage]
class PurchaseRoute extends _i14.PageRouteInfo<PurchaseRouteArgs> {
  PurchaseRoute({
    _i15.Key? key,
    required String buyerId,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         PurchaseRoute.name,
         args: PurchaseRouteArgs(key: key, buyerId: buyerId),
         initialChildren: children,
       );

  static const String name = 'PurchaseRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PurchaseRouteArgs>();
      return _i14.WrappedRoute(
        child: _i8.PurchasePage(key: args.key, buyerId: args.buyerId),
      );
    },
  );
}

class PurchaseRouteArgs {
  const PurchaseRouteArgs({this.key, required this.buyerId});

  final _i15.Key? key;

  final String buyerId;

  @override
  String toString() {
    return 'PurchaseRouteArgs{key: $key, buyerId: $buyerId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PurchaseRouteArgs) return false;
    return key == other.key && buyerId == other.buyerId;
  }

  @override
  int get hashCode => key.hashCode ^ buyerId.hashCode;
}

/// generated route for
/// [_i9.RegionPage]
class RegionRoute extends _i14.PageRouteInfo<RegionRouteArgs> {
  RegionRoute({
    _i15.Key? key,
    required _i16.CardCategoryEntity category,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         RegionRoute.name,
         args: RegionRouteArgs(key: key, category: category),
         initialChildren: children,
       );

  static const String name = 'RegionRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegionRouteArgs>();
      return _i14.WrappedRoute(
        child: _i9.RegionPage(key: args.key, category: args.category),
      );
    },
  );
}

class RegionRouteArgs {
  const RegionRouteArgs({this.key, required this.category});

  final _i15.Key? key;

  final _i16.CardCategoryEntity category;

  @override
  String toString() {
    return 'RegionRouteArgs{key: $key, category: $category}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RegionRouteArgs) return false;
    return key == other.key && category == other.category;
  }

  @override
  int get hashCode => key.hashCode ^ category.hashCode;
}

/// generated route for
/// [_i10.ShopsPage]
class ShopsRoute extends _i14.PageRouteInfo<void> {
  const ShopsRoute({List<_i14.PageRouteInfo>? children})
    : super(ShopsRoute.name, initialChildren: children);

  static const String name = 'ShopsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return _i14.WrappedRoute(child: const _i10.ShopsPage());
    },
  );
}

/// generated route for
/// [_i11.SignUpPage]
class SignUpRoute extends _i14.PageRouteInfo<void> {
  const SignUpRoute({List<_i14.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.SignUpPage();
    },
  );
}

/// generated route for
/// [_i12.SplashPage]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashPage();
    },
  );
}

/// generated route for
/// [_i13.VerifyEmailPage]
class VerifyEmailRoute extends _i14.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i14.PageRouteInfo>? children})
    : super(VerifyEmailRoute.name, initialChildren: children);

  static const String name = 'VerifyEmailRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.VerifyEmailPage();
    },
  );
}

import 'package:base_cards/app/di/locator.dart';
import 'package:base_cards/core/enums/user_role.dart';
import 'package:base_cards/core/storage/secure_storage_api.dart';
import 'package:flutter/material.dart';

extension UserRoleX on BuildContext {
  Future<bool> get isSupplier async {
    final String? role = await getIt<SecureStorageApi>().getUserRole();
    return role?.toLowerCase() == UserRole.supplier.value;
  }

  Future<bool> get isShop async {
    final String? role = await getIt<SecureStorageApi>().getUserRole();
    return role?.toLowerCase() == UserRole.shop.value;
  }
}

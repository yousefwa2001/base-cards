import 'dart:ui';
import 'package:base_cards/app/di/locator.dart';
import 'package:base_cards/core/storage/secure_storage_api.dart';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final String? savedCode = await getIt<SecureStorageApi>().getLocale();

  late Locale initialLocale;

  if (savedCode != null) {
    initialLocale = Locale(savedCode);
  } else {
    final deviceLocale = PlatformDispatcher.instance.locale;
    const List<String> supported = ['ar', 'en'];

    if (supported.contains(deviceLocale.languageCode)) {
      initialLocale = Locale(deviceLocale.languageCode);
    } else {
      initialLocale = const Locale('ar');
    }
  }
  runApp(MyApp(initialLocale: initialLocale));
}

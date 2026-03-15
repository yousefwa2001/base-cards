import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../storage/secure_storage_api.dart';

class LocaleCubit extends Cubit<Locale> {
  final SecureStorageApi _storage;

  LocaleCubit({
    required Locale initialLocale,
    required SecureStorageApi storage,
  })  : _storage = storage,
        super(initialLocale);


  Future<void> setLocale(Locale locale) async {
    emit(locale);
    await _storage.setLocale(locale.languageCode);
  }


  Future<void> toggleLocale() async {
    if (state.languageCode == 'ar') {
      await setLocale(const Locale('en'));
    } else {
      await setLocale(const Locale('ar'));
    }
  }
}

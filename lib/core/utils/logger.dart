import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

class AppLogger {
  static void info(Object? message, {String name = 'INFO'}) {
    if (kDebugMode) developer.log('ℹ️ $message', name: name);
  }

  static void warn(Object? message, {String name = 'WARN'}) {
    if (kDebugMode) developer.log('⚠️ $message', name: name);
  }

  static void error(
    Object? message, {
    String name = 'ERROR',
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      developer.log(
        '❌ $message',
        name: name,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}

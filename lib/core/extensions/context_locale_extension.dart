import 'package:flutter/material.dart';

extension ArabicLocaleX on BuildContext {
  bool get isArabic {
    final code = Localizations.maybeLocaleOf(this)?.languageCode;
    if (code != null) return code == 'ar';

    return Directionality.of(this) == TextDirection.rtl;
  }
}

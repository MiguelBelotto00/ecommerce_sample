import 'package:ecommerce_sample/src/l10n/app_localization.dart';
import 'package:flutter/material.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalization get l10n => AppLocalization.of(this)!;
}

extension DarkMode on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

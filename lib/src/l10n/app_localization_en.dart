import 'app_localization.dart';

/// The translations for English (`en`).
class AppLocalizationEn extends AppLocalization {
  AppLocalizationEn([super.locale = 'en']);

  @override
  String get welcome => 'Welcome';

  @override
  String get login => 'Login';
}

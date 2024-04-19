import 'app_localization.dart';

/// The translations for English (`en`).
class AppLocalizationEn extends AppLocalization {
  AppLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get appVersion => 'App version';

  @override
  String welcomeMessage(String userName) {
    return 'Welcome $userName';
  }

  @override
  String get myData => 'My data';

  @override
  String get myFavorites => 'My favorites';
}

import 'app_localization.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationEs extends AppLocalization {
  AppLocalizationEs([String locale = 'es']) : super(locale);

  @override
  String get welcome => 'Bienvenido';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get appVersion => 'versión:';

  @override
  String welcomeMessage(String userName) {
    return 'Bienvenido $userName';
  }

  @override
  String get myData => 'Mis datos';

  @override
  String get myFavorites => 'Mis favoritos';
}

/// Classe de definição das constantes mais gerais do App
///
/// Constantes de configuração [BaseHttp]
/// Nome do app
class AppConstants {
  AppConstants._();

  /// [BaseHttp]
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const int refreshTokenAttemps = 1;

  /// [Screen Size]
  static const int designScreenWidth = 375;
  static const int designScreenHeight = 812;

  /// [Commom Strings]
  static const String unauthorized = 'Unauthorized Request!';
  static const String forbidden = 'Forbidden Request!';
  static const String internalServerError = 'Internal Server Error!';
  static const String serviceUnavailable = 'Service Unavailable!';

  /// [Localizations]
  static const String localizationPath = 'lib/i18n';

  /// [Firebase]
  static const int firebaseFetchTimeoutInMinutes = 180;

  /// [Mixpanel]
  static const String tokenMixpanel = '23ae2ec11966f649511eec9f74f3bd3d';
}

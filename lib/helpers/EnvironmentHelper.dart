

abstract class EnvironmentHelper {
  static Map<String, String> _envServer = Map();

  static bool isLoaded() {
    return _envServer.isNotEmpty;
  }


  static String appName() => _envServer['APP_NAME'] ?? 'Siyakhula Development Academy';

  static String appNameShort() => _envServer['APP_NAME_SHORT'] ?? 'SDA';

  static String appVersion() => _envServer['APP_VERSION'] ?? 'v0.0.1-beta';

  static String appFacebookPageUrl() => _envServer['APP_FACEBOOK_URL'] ?? 'https://www.facebook.com/siyakhuladevelpoment';
}

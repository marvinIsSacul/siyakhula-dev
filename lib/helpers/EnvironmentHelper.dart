

abstract class EnvironmentHelper {
  static Map<String, String> _envServer = Map();

  static bool isLoaded() {
    return _envServer.isNotEmpty;
  }

  static String appDomain() => _envServer['APP_NAME'] ?? 'siyakahuladev.co.za';

  static String appUrl() => _envServer['APP_NAME'] ?? 'http://' + appDomain();

  static String appName() => _envServer['APP_NAME'] ?? 'Siyakhula Development Academy';

  static String appNameShort() => _envServer['APP_NAME_SHORT'] ?? 'SDA';

  static String appVersion() => _envServer['APP_VERSION'] ?? 'v0.0.1-beta';

  static String appFacebookPageUrl() => _envServer['APP_FACEBOOK_URL'] ?? 'https://www.facebook.com/siyakhuladevelpoment';

  static String phonePrimary() => _envServer['APP_PHONE_PRIMARY'] ?? '078-319-3573';

  static String emailSupport() => _envServer['APP_PHONE_PRIMARY'] ?? 'support@' + appDomain();
  static String emailAccounts() => _envServer['APP_PHONE_PRIMARY'] ?? 'accounts@' + appDomain();

  static String addressPrimary() => _envServer['APP_PHONE_PRIMARY'] ?? '256 Cala Street, Wedela Carletonville';
}

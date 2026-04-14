import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:learn_flutter/flavors.dart';

class System {
  static const supportedLocales = [Locale('en', 'US'), Locale('vi', 'VN')];

  static const defaultLocale = Locale('vi', 'VN');

  static const int receiveTimeout = 60000;
  static const int connectionTimeout = 60000;
  static Map<String, String> header({String? token}) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }
}

class URL {
  static String? devUrl = dotenv.env['DEV_URL'];
  static String? qaUrl = dotenv.env['QA_URL'];
  static String? proUrl = dotenv.env['PRO_URL'];

  static String _fallback(String? url) {
    if (url == null || url.trim().isEmpty) {
      return "http://10.0.2.2:3000";
    }
    return url;
  }

  static String getBaseURL() {
    switch (F.appFlavor) {
      case Flavor.development:
        return _fallback(devUrl);
      case Flavor.staging:
        return _fallback(qaUrl);
      case Flavor.production:
        return _fallback(proUrl);
    }
  }
}

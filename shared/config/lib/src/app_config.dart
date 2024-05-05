import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  AppConfig._();

  static String get flavor => dotenv.get("FLAVOR", fallback: "unknown");
  static String get appName => dotenv.get("APP_NAME", fallback: "unknown");

  static Future<void> loadEnv(EnvType type) async {
    switch (type) {
      case EnvType.prod:
        dotenv.load(fileName: ".env");
        break;
      default:
        dotenv.load(fileName: ".env_dev");
    }
  }
}

enum EnvType {
  dev,
  prod;
}
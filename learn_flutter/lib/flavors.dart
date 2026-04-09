enum Flavor { dev, staging, prod }

class Flavors {
  static Flavor? appFlavor;
  static String get name => appFlavor?.name ?? "";
  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return "[DEV]";
      case Flavor.staging:
        return "[QA]";
      case Flavor.prod:
        return "[PRO]";
      default:
        return "Title";
    }
  }
}


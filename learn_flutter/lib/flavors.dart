enum Flavor { production, development, staging }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.production:
        return 'Prod';
      case Flavor.development:
        return '[DEV]';
      case Flavor.staging:
        return '[STAG]';
    }
  }
}

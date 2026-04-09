import 'package:learn_flutter/flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  Flavors.appFlavor = Flavor.staging;
  await runner.main();
}

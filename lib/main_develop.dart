import 'package:sharexe/configs/flavor/flavor_config.dart';
import 'package:sharexe/main.dart' as runner;

Future<void> main() async {
  FlavorConfig.appFlavor = Flavor.develop;
  runner.main();
}

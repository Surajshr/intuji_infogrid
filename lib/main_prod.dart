import 'package:intuji_infogrid/app/ui/app.dart';
import 'package:intuji_infogrid/bootstrap.dart';
import 'package:intuji_infogrid/core/constants/environment_constant.dart';
import 'package:intuji_infogrid/start_up.dart';

void main() async {
  EnvironmentConstants.setEnvVariables(Environment.prod);
  await initializeApp();
  await bootstrap(() => const App(environment: Environment.prod));
}

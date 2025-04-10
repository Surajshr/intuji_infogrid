import 'package:intuji_infogrid/app/ui/app.dart';
import 'package:intuji_infogrid/core/constants/environment_constant.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/start_up.dart';

void main() async {
  EnvironmentConstants.setEnvVariables(Environment.uat);
  await initializeApp();
  runApp(const App(environment: Environment.uat));
}

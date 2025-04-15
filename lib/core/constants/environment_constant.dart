abstract class Environment {
  static const dev = 'dev';
  static const prod = 'prod';
  static const uat = 'uat';
}

class EnvironmentConstants {
  static late String baseUrl = '';

  static void setEnvVariables(String env) {
    switch (env) {
      case Environment.dev:
        baseUrl = 'https://api.intuji_dev.com/';

        //urls depend on dev  env
        break;
      case Environment.prod:
        baseUrl = 'https://api.intuji.com/';
        //urls depend on prod env
        break;
      case Environment.uat:
        baseUrl = 'https://api.intuji_uat.com/';
        //urls depend on uat env
        break;
      default:
        baseUrl = 'https://api.intuji_dev.com/';

        break;
    }
  }
}

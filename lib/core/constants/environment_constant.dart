abstract class Environment {
  static const dev = 'dev';
  static const prod = 'prod';
  static const uat = 'uat';
}

class EnvironmentConstants {
  static late String baseUrl = '';

  static late String firebaseDatabaseUrl = '';

  static void setEnvVariables(String env) {
    switch (env) {
      case Environment.dev:
        baseUrl = 'Example.com';
        firebaseDatabaseUrl = 'Example.com';

        //urls depend on dev  env
        break;
      case Environment.prod:
        //urls depend on prod env
        break;
      default:
        baseUrl = 'Example.com';
        firebaseDatabaseUrl = 'Example.com';
        break;
    }
  }
}

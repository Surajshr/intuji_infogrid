import 'package:intuji_infogrid/route/route_imports.dart';

class AppRoutes {
  const AppRoutes._();
  static const String splash = '/splash';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String forgetPassword = '/forget-password';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SplashBaseScreen(),
        );
      case login:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LoginBaseScreen(),
        );
      case dashboard:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const DashboardBaseScreen(),
        );
      case forgetPassword:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ForgetPasswordBaseScreen(),
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}

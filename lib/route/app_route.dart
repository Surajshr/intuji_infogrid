import 'package:intuji_infogrid/feature/dashboard/domain/entities/product_entity.dart';
import 'package:intuji_infogrid/feature/dashboard/presentation/widgets/dashboard_nav_bar.dart';
import 'package:intuji_infogrid/feature/members/presentation/pages/member_search_screen.dart';
import 'package:intuji_infogrid/feature/product_detail/presentation/pages/product_detail_base_view.dart';
import 'package:intuji_infogrid/route/route_imports.dart';

class AppRoutes {
  const AppRoutes._();
  static const String splash = '/splash';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String forgetPassword = '/forget-password';
  static const String productDetail = '/product-detail';
  static const String memberSearch = '/member-search';

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
          builder: (_) => const DashboardNavBar(),
        );

      case forgetPassword:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ForgetPasswordBaseScreen(),
        );
      case productDetail:
        return MaterialPageRoute<dynamic>(
          builder:
              (_) => ProductDetailBaseView(
                product: settings.arguments as ProductDetailModel,
              ),
        );
      case memberSearch:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const MemberSearchScreen(),
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

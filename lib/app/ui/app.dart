import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intuji_infogrid/core/constants/app_constants.dart';
import 'package:intuji_infogrid/core/constants/environment_constant.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intuji_infogrid/route/app_route.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  final String environment;

  const App({super.key, required this.environment});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // Or rtl if you're using Arabic/Hebrew
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ScreenUtilInit(
            designSize: Size(AppConstants.kAppWidth, AppConstants.kAppHeight),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              initialRoute: AppRoutes.splash,
              onGenerateRoute: AppRoutes.onGenerateRoute,
            ),
          ),
          if (environment == Environment.dev || environment == Environment.uat)
            Banner(
              message: environment.toUpperCase(),
              location: BannerLocation.topEnd,
              color: environment == Environment.dev ? Colors.red : Colors.blue,
            ),
        ],
      ),
    );
  }
}

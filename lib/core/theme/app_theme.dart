import 'package:intuji_infogrid/core/imports/ui_imports.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.kSecondaryColor,
      disabledColor: AppColor.kTextDisabledColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColor.kPrimaryColor,
        circularTrackColor: AppColor.kPrimaryColorLight,
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kPrimaryColor),
    );
  }
}

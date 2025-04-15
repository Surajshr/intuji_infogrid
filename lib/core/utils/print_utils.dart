import 'dart:developer' as developer;

class PrintUtil {
  static void printLog({required String message, required String tag}) {
    developer.log(message, name: tag);
  }
}

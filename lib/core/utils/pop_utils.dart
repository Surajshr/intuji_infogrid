import 'package:intuji_infogrid/core/imports/ui_imports.dart';

extension ContextCustomExtension on BuildContext {
  void popTimes(int timesToPop) {
    for (var i = 0; i < timesToPop; i++) {
      Navigator.of(this).pop();
    }
  }
}

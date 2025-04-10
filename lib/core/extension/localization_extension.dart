
import '../../route/route_imports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get translate {
    return AppLocalizations.of(this)!;
  }
}



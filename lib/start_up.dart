import 'package:flutter/services.dart';
import 'package:intuji_infogrid/core/di/di.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';

/// This file contains initialization logic for the application.
///
/// The [initializeApp] function handles core app initialization tasks like:
/// - Ensuring Flutter bindings are initialized
/// - Setting up dependency injection
/// - Setting preferred screen orientations to portrait only
/// - Configuring system UI overlays and colors
///

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

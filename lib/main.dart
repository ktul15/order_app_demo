import 'package:flutter/material.dart';
import 'package:order_app_demo/utils/app_config.dart' as appConfig;
import 'package:order_app_demo/utils/database.dart';
import 'package:order_app_demo/utils/di_initializer.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appConfig.AppConfig.setEnvironment(appConfig.Environment.dev);
  await LocalDatabase.initDatabase();

  configureDependencies();

  runApp(const App());
}

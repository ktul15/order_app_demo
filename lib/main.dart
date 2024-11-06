import 'package:flutter/material.dart';
import 'package:order_app_demo/utils/app_config.dart';
import 'package:order_app_demo/utils/database.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.setEnvironment(Environment.dev);
  await LocalDatabase.initDatabase();

  runApp(const App());
}

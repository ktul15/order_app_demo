import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLogging();

  runApp(const App());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:order_app_demo/utils/app_config.dart';
import 'package:order_app_demo/utils/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'app.dart';

late Database database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLogging();
  AppConfig.setEnvironment(Environment.dev);

  database = await openDatabase(
    join(await getDatabasesPath(), 'add_order.db'),
    version: 2,
    onCreate: (db, version) async {
      print("in oncreate");
      // Run the CREATE TABLE statement on the database.
      await db.execute(
        'CREATE TABLE ${Constants.categories_db_table}(name TEXT PRIMARY KEY)',
      );
      await db.execute(
        'CREATE TABLE ${Constants.customers_db_table}(AccountRef TEXT PRIMARY KEY, Name TEXT, DiscountPercentage REAL)',
      );
      await db.execute(
        'CREATE TABLE ${Constants.products_db_table}(Id INT PRIMARY KEY, Name TEXT, PRICE REAL, ProductCategory TEXT, ProductCode TEXT, ProductVatId INT)',
      );
      return;
    },
  );

  runApp(const App());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

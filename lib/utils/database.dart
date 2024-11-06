import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'constants.dart';

class LocalDatabase {
  static Database? database;

  static Future<void> initDatabase() async {
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
          'CREATE TABLE ${Constants.products_db_table}(Id INT PRIMARY KEY, Name TEXT, Price REAL, ProductCategory TEXT, ProductCode TEXT, ProductVatId INT)',
        );
        return;
      },
    );
  }
}

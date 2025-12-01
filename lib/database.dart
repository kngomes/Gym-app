import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'treinos.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE treinos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT,
            feito INTEGER
          )
          '''
        );
      },
      version: 1,
    );
  }
}

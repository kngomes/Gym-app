import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TreinosDatabase {
  static final TreinosDatabase instance = TreinosDatabase._init();
  static Database? _database;

  TreinosDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('treinos.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const treinoTable = '''
      CREATE TABLE treinos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        data TEXT NOT NULL
      );
    ''';

    await db.execute(treinoTable);
  }

  // === ADICIONAR TREINO
  Future<int> addTreino(String nome) async {
    final db = await instance.database;

    return await db.insert('treinos', {
      'nome': nome,
      'data': DateTime.now().toIso8601String(),
    });
  }

  // === LISTAR TREINOS
  Future<List<Map<String, dynamic>>> getTreinos() async {
    final db = await instance.database;

    return await db.query('treinos', orderBy: 'id DESC');
  }

  // === DELETAR TREINO
  Future<int> deleteTreino(int id) async {
    final db = await instance.database;

    return await db.delete('treinos', where: 'id = ?', whereArgs: [id]);
  }
}

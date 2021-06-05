import 'package:path/path.dart';
import 'package:qrcode_app/model/qrcode.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {

  static const String KEY_DATABASE = "key_database";

  static const String TABLE_QR = "qrcode";
  static const String COLUMN_ID = "id";
  static const String COLUMN_TYPE = "type";
  static const String COLUMN_TITLE = "title";
  static const String COLUMN_CONTENT = "content";
  static const String COLUMN_TIME = "time";
  static const String COLUMN_FAVORITE = "favorite";

  static final DatabaseProvider instance = DatabaseProvider._init();

  static Database _database;

  DatabaseProvider._init();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB('qrcode.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''CREATE TABLE $TABLE_QR(
        ${QRFields.id} $idType,
        ${QRFields.type} $integerType,
        ${QRFields.time} $textType,
        ${QRFields.title} $textType,
        ${QRFields.content} $textType,
        ${QRFields.isFavorite} $boolType
        )''');
  }

  Future<QRCode> create(QRCode qrCode) async {
    final db = await instance.database;
    final id = await db.insert(TABLE_QR, qrCode.toJson());
    return qrCode.copy(id: id);
  }

  Future<QRCode> readQrCode(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      TABLE_QR,
      columns: QRFields.values,
      where: '${QRFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return QRCode.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<QRCode>> getQR() async {
    final db = await instance.database;
    final result = await db.query(TABLE_QR);
    return result.map((json) => QRCode.fromJson(json)).toList();
  }

  Future<List<QRCode>> getFavoriteQR() async {
    final db = await instance.database;
    final result = await db.query(TABLE_QR,
        where: '${QRFields.isFavorite} = ?', whereArgs: [true]);
    return result.map((json) => QRCode.fromJson(json)).toList();
  }

  // Future<QRCode> insert(QRCode qrCode) async {
  //   final db = await database;
  //   qrCode.id = await db.insert(TABLE_QR, qrCode.toJson());
  //   return qrCode;
  // }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      TABLE_QR,
      where: '${QRFields.id} = ?',
      whereArgs: [id],
    );
    // final db = await database;
    //
    // return await db.delete(
    //   TABLE_QR,
    //   where: "id = ?",
    //   whereArgs: [id],
    // );
  }

  Future<int> update(QRCode qrCode) async {
    // final db = await database;
    //
    // return await db.update(
    //   TABLE_QR,
    //   qrCode.toMap(),
    //   where: "id = ?",
    //   whereArgs: [qrCode.id],
    // );
    final db = await instance.database;

    return db.update(
      TABLE_QR,
      qrCode.toJson(),
      where: '${QRFields.id} = ?',
      whereArgs: [qrCode.id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

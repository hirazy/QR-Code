import 'package:path/path.dart';
import 'package:qrcode_app/model/qrcode.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const String KEY_DATABASE = "key_database";

  static const String TABLE_QR = "qr";
  static const String COLUMN_ID = "id";
  static const String COLUMN_TYPE = "type";
  static const String COLUMN_TITLE = "title";
  static const String COLUMN_CONTENT = "content";
  static const String COLUMN_TIME = "time";
  static const String COLUMN_FAVORITE = "favorite";

  static Database _database;

  static final DatabaseProvider instance = DatabaseProvider._init();

  DatabaseProvider._init();

  static final DatabaseProvider db = DatabaseProvider._init();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'qr.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute(
          "CREATE TABLE $TABLE_QR ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_TYPE INTEGER,"
          "$COLUMN_TIME TEXT,"
          "$COLUMN_TITLE TEXT,"
          "$COLUMN_CONTENT TEXT,"
          "$COLUMN_FAVORITE BOOLEAN"
          ")",
        );
      },
    );
  }

  Future<List<QRCode>> getQR() async {
    final db = await database;
    var qrCodes = await db.query(TABLE_QR, columns: [
      COLUMN_ID,
      COLUMN_TYPE,
      COLUMN_TITLE,
      COLUMN_CONTENT,
      COLUMN_TIME,
      COLUMN_FAVORITE
    ]);

    List<QRCode> qrList = List<QRCode>();

    qrCodes.forEach((qrCodeTmp) {
      QRCode qrCode = QRCode.fromMap(qrCodeTmp);
      qrList.add(qrCode);
    });

    return qrList;
  }

  Future<QRCode> insert(QRCode qrCode) async {
    final db = await database;
    qrCode.id = await db.insert(TABLE_QR, qrCode.toMap());
    return qrCode;
  }

  Future<int> delete(int id) async {
    final db = await database;

    return await db.delete(
      TABLE_QR,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(QRCode qrCode) async {
    final db = await database;

    return await db.update(
      TABLE_QR,
      qrCode.toMap(),
      where: "id = ?",
      whereArgs: [qrCode.id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

}

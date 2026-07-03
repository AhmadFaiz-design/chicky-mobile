import 'package:chicky/models/fcr_model.dart';
import 'package:chicky/models/input_rusak_model.dart';
import 'package:chicky/models/fcrHistory_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ServiceDatabase {
  static final ServiceDatabase instance = ServiceDatabase._init();
  static Database? _database;

  ServiceDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB('chicky_db');
    return _database!;
  }

  // Inisialisasi Database, jika database belum ada
  Future<Database> initDB(String path) async {
    String path_db = await getDatabasesPath();
    String db = join(path_db, path);
    return await openDatabase(db, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(''' CREATE TABLE tabel_log_fcr(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      hasilFCR REAL NOT NULL,
      ayam REAL NOT NULL,
      pakan REAL NOT NULL,
      amonia REAL NOT NULL,
      suhu REAL NOT NULL,
      kelembaban REAL NOT NULL,
      cahaya REAL NOT NULL,
      bising REAL NOT NULL,
      predict_telur REAL NOT NULL,
      namahari TEXT NOT NULL,
      tanggalLengkap TEXT NOT NULL,
      id_log_rusak INTEGER,
      FOREIGN KEY (id_log_rusak) REFERENCES tabel_log_rusak
      )
      ''');
    await db.execute(''' CREATE TABLE tabel_input_rusak(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nama_inputan_rusak TEXT
      )
      ''');
  }

  Future<int> insertTabelLogFCR(FCRModel FcrModel) async {
    Database db = await instance.database;
    return await db.insert('tabel_log_fcr', FcrModel.tomap());
  }

  Future<int> insertTabelInputRusak(InputRusakModel inputRusak) async {
    Database db = await instance.database;
    String inputRusakToString = inputRusak.inputRusak.join(',');
    print('Text input: $inputRusakToString');
    return await db.insert('tabel_input_rusak', {
      'nama_inputan_rusak': inputRusakToString,
    });
  }

  Future<List<FCRModel>> getAllDataFCR() async {
    Database db = await instance.database;
    var result = await db.query('tabel_log_fcr', orderBy: 'id DESC');
    return result.map((json) => FCRModel.fromMap(json)).toList();
  }

  Future<List<InputRusakModel>> getAllDataRusak() async {
    Database db = await instance.database;
    var result = await db.query('tabel_input_rusak', orderBy: 'id DESC');
    return result.map((json) => InputRusakModel.fromMap(json)).toList();
  }

  Future<List<FcrHistoryModel>> getFcrHistory() async {
    Database db = await instance.database;

    // Menggabungkan tabel_log_fcr dengan tabel_input_rusak berdasarkan jembatan FK id_log_rusak
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT f.*, r.nama_inputan_rusak 
    FROM tabel_log_fcr f
    LEFT JOIN tabel_input_rusak r ON f.id_log_rusak = r.id
    ORDER BY f.id DESC
    ''');

    return maps.map((json) => FcrHistoryModel.fromMap(json)).toList();
  }

  Future<List<FcrHistoryModel>> getFCRForChart() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> raw = await db.rawQuery('''
    SELECT f.*, r.nama_inputan_rusak 
    FROM tabel_log_fcr f
    LEFT JOIN tabel_input_rusak r ON f.id_log_rusak = r.id
    ORDER BY f.id DESC
    LIMIT 7
    ''');
    return raw.map((json) => FcrHistoryModel.fromMap(json)).toList();
  }
}

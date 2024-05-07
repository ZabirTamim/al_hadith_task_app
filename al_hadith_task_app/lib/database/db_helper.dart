import 'dart:io';
//import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/hadith.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'hadith_db.db');

    // Check if the database exists
    if (await databaseExists(path)) {
      // Database exists
      return await openDatabase(path);
    } else {
      // Copy the database from assets if it doesn't exist
      ByteData data = await rootBundle.load(join('assets', 'hadith_db.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      return await openDatabase(path);
    }
  }

  Future<List<Hadith>> getHadithList() async {
    Database? db = await database;
    List<Map<String, dynamic>> maps = await db!.query('books');
    return List.generate(maps.length, (i) {
      return Hadith(
        id: maps[i]['id'],
        title: maps[i]['title'],
        titleAr: maps[i]['title_ar'],
        numberOfHadis: maps[i]['number_of_hadis'],
        abvrCode: maps[i]['abvr_code'],
        bookName: maps[i]['book_name'],
        bookDescr: maps[i]['book_descr'],
      );
    });
  }

/*  Future<void> insertHadith(Hadith hadith) async {
    Database db = await database;
    await db.insert('hadith', hadith.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateHadith(Hadith hadith) async {
    Database db = await database;
    await db.update('hadith', hadith.toMap(),
        where: 'id = ?', whereArgs: [hadith.id]);
  }

  Future<void> deleteHadith(int id) async {
    Database db = await database;
    await db.delete('hadith', where: 'id = ?', whereArgs: [id]);
  }*/
}

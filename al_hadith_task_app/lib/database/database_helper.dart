import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/books.dart';
import '../models/chapter.dart';
import '../models/hadith.dart';
import '../models/section.dart';

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
    // Get the directory for the database
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'hadith_db.db');

    // Check if the database exists
    if (await databaseExists(path)) {
      // Database exists
      return await openDatabase(path);
    } else {
      // Copy the database from assets if it doesn't exist
      ByteData data = await rootBundle.load('assets/hadith_db.db');
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      return await openDatabase(path);
    }
  }

  // CHAPTER TABLE

  Future<List<Map<String, dynamic>>> getBooks() async {
    Database? db = await database;
    return await db!.query('books', columns: ['title', 'abvr_code']);
  }

  Future<List<Map<String, dynamic>>> getChapters() async {
    Database? db = await database;
    return await db!.query('chapter', columns: ['title', 'hadis_range']);
  }

  Future<List<Map<String, dynamic>>> getSections() async {
    Database? db = await database;
    return await db!.query('section', columns: ['number', 'title', 'preface']);
  }

  Future<List<Map<String, dynamic>>> getHadith() async {
    Database? db = await database;
    return await db!.query('hadith',
        columns: ['hadith_id', 'grade', 'grade_color', 'narrator', 'ar', 'bn', 'note']);
  }
}
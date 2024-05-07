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

  Future<List<Chapter>> getChapterList() async {
    Database? db = await database;
    List<Map<String, dynamic>> maps = await db!.query('chapter');
    return List.generate(maps.length, (i) {
      return Chapter(
        id: maps[i]['id'],
        chapterId: maps[i]['chapter_id'],
        bookId: maps[i]['book_id'],
        title: maps[i]['title'],
        number: maps[i]['number'],
        hadisRange: maps[i]['hadis_range'],
        bookName: maps[i]['book_name'],
      );
    });
  }

  // BOOKS TABLE

  Future<List<Books>> getBooksList() async {
    Database? db = await database;
    List<Map<String, dynamic>> maps = await db!.query('books');
    return List.generate(maps.length, (i) {
      return Books(
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

  // HADITH TABLE

  Future<List<Hadith>> getHadithList() async {
    Database? db = await database;
    List<Map<String, dynamic>> maps = await db!.query('hadith');
    return List.generate(maps.length, (i) {
      return Hadith(
        hadithId: maps[i]['hadith_id'],
        bookId: maps[i]['book_id'],
        chapterId: maps[i]['chapter_id'],
        sectionId: maps[i]['section_id'],
        narrator: maps[i]['narrator'],
        bn: maps[i]['bn'],
        ar: maps[i]['ar'],
        arDiacless: maps[i]['ar_diacless'],
        note: maps[i]['note'],
        gradeId: maps[i]['grade_id'],
        grade: maps[i]['grade'],
        gradeColor: maps[i]['grade_color'],
      );
    });
  }

  // SECTION TABLE

  Future<List<Section>> getSectionList() async {
    Database? db = await database;
    List<Map<String, dynamic>> maps = await db!.query('section');
    return List.generate(maps.length, (i) {
      return Section(
        id: maps[i]['id'],
        bookId: maps[i]['book_id'],
        chapterId: maps[i]['chapter_id'],
        sectionId: maps[i]['section_id'],
        title: maps[i]['title'],
        preface: maps[i]['preface'],
        number: maps[i]['number'],
      );
    });
  }
}

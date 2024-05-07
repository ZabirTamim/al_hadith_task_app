

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/*class DatabaseHelper{
  static final _databaseName = 'hadith_db.db';
  static final _databaseVersion = 1;
  static final table = 'books';
  static final columnId = 'id';
  static final columnTitle = 'title';
  static final columnTitleAr = 'title_ar';
  static final columnNumberOfHadis = 'number_of_hadis';
  static final columnAbvrCode = 'abvr_code';
  static final columnBookName = 'book_name';
  static final columnBookDescr = 'book_descr';

  /// constructor
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();


  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);

    var exists = await databaseExists(path);
    if(!exists) {

      print("copy database opened");
      try{
        await Directory(dirname(path)).create(recursive: true);
      }
      catch(_){}

      ByteData data = await rootBundle.load(join("assets", _databaseName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening Existing Database");
    }

  }



}*/

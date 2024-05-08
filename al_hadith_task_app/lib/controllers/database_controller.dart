import 'package:get/get.dart';

import '../database/database_helper.dart';
import '../models/books.dart';


class DatabaseController extends GetxController {
  var booksList = <Map<String, dynamic>>[].obs;
  var chaptersList = <Map<String, dynamic>>[].obs;
  var hadithList = <Map<String, dynamic>>[].obs;
  var sectionsList = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
    fetchChapters();
    fetchHadith();
    fetchSections();
  }

  void fetchBooks() async {
    isLoading.value = true;
    try {
      var dbHelper = DatabaseHelper();
      var fetchedBooks = await dbHelper.getBooks();
      booksList.value = fetchedBooks;
    } finally {
      isLoading.value = false;
    }
  }
  void fetchChapters() async {
    isLoading.value = true;
    try {
      var dbHelper = DatabaseHelper();
      var fetchedChapters = await dbHelper.getChapters();
      chaptersList.value = fetchedChapters;
    } finally {
      isLoading.value = false;
    }
  }
  void fetchHadith() async {
    isLoading.value = true;
    try {
      var dbHelper = DatabaseHelper();
      var fetchedHadith = await dbHelper.getHadith();
      hadithList.value = fetchedHadith;
    } finally {
      isLoading.value = false;
    }
  }
  void fetchSections() async {
    isLoading.value = true;
    try {
      var dbHelper = DatabaseHelper();
      var fetchedSections = await dbHelper.getSections();
      sectionsList.value = fetchedSections;
    } finally {
      isLoading.value = false;
    }
  }
}
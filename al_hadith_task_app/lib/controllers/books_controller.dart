import 'package:get/get.dart';

import '../database/database_helper.dart';
import '../models/books.dart';


class BooksController extends GetxController {
  var booksList = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
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
}

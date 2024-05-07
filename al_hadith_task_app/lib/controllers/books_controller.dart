import 'package:get/get.dart';

import '../database/database_helper.dart';
import '../models/books.dart';


class BooksController extends GetxController {
  var booksList = <Books>[].obs;
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
      var fetchedBooks = await dbHelper.getBooksList();
      booksList.value = fetchedBooks;
    } finally {
      isLoading.value = false;
    }
  }
}

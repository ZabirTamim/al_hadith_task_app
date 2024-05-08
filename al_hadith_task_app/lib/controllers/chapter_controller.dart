

import 'package:get/get.dart';

import '../database/database_helper.dart';
import '../models/chapter.dart';

class ChapterController extends GetxController {
  var chaptersList = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchChapters();
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
}

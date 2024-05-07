

import 'package:get/get.dart';

import '../database/database_helper.dart';
import '../models/chapter.dart';

class ChapterController extends GetxController {
  var chapterList = <Chapter>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchChapter();
  }

  void fetchChapter() async {
    isLoading.value = true;
    try {
      var dbHelper = DatabaseHelper();
      var fetchedChapter = await dbHelper.getChapterList();
      chapterList.value = fetchedChapter;
    } finally {
      isLoading.value = false;
    }
  }
}

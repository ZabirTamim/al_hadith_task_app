

import 'package:get/get.dart';

import '../database/database_helper.dart';
import '../models/section.dart';

class SectionController extends GetxController {
  var sectionsList = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSections();
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

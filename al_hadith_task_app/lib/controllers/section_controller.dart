

import 'package:get/get.dart';

import '../database/database_helper.dart';
import '../models/section.dart';

class SectionController extends GetxController {
  var sectionList = <Section>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSection();
  }

  void fetchSection() async {
    isLoading.value = true;
    try {
      var dbHelper = DatabaseHelper();
      var fetchedSection = await dbHelper.getSectionList();
      sectionList.value = fetchedSection;
    } finally {
      isLoading.value = false;
    }
  }
}

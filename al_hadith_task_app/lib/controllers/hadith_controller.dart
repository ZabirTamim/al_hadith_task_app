

import 'package:get/get.dart';

import '../database/database_helper.dart';
import '../models/hadith.dart';

class HadithController extends GetxController {
  var hadithList = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHadith();
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
}

import 'package:get/get.dart';

import '../database/db_helper.dart';
import '../models/hadith.dart';


class HadithController extends GetxController {
  var hadithList = <Hadith>[].obs;
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
      var fetchedHadith = await dbHelper.getHadithList();
      hadithList.value = fetchedHadith;
    } finally {
      isLoading.value = false;
    }
  }

/*  void addHadith(Hadith hadith) async {
    var dbHelper = DatabaseHelper();
    await dbHelper.insertHadith(hadith);
    fetchHadith(); // Refresh the list after insertion
  }

  void updateHadith(Hadith hadith) async {
    var dbHelper = DatabaseHelper();
    await dbHelper.updateHadith(hadith);
    fetchHadith(); // Refresh the list after update
  }

  void deleteHadith(int id) async {
    var dbHelper = DatabaseHelper();
    await dbHelper.deleteHadith(id);
    fetchHadith(); // Refresh the list after deletion
  }*/
}

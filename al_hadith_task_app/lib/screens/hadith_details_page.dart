

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/hadith_controller.dart';

class HadithDetailsPage extends StatelessWidget {
  HadithDetailsPage({super.key});

  final HadithController hadithController = Get.put(HadithController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        if (hadithController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Text(hadithController.hadithList[0].id.toString()),
            Text(hadithController.hadithList[0].title!),
            Text(hadithController.hadithList[0].titleAr!),
            Text(hadithController.hadithList[0].numberOfHadis.toString()),
            Text(hadithController.hadithList[0].abvrCode!),
            Text(hadithController.hadithList[0].bookName!),
            Text(hadithController.hadithList[0].bookDescr!),
          ],
        );
      }
      ),
    );
  }
}

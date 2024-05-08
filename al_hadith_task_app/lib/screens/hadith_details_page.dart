import 'package:al_hadith_task_app/const/color_const.dart';
import 'package:al_hadith_task_app/widgets/hadith_details_box.dart';
import 'package:al_hadith_task_app/widgets/hadith_header_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/database_controller.dart';
import '../widgets/flexible_app_bar.dart';

class HadithDetailsPage extends StatelessWidget {
  HadithDetailsPage({
    super.key,
  });

  final DatabaseController databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AlHadithColors.navGreen,
      body: Obx(() {
        if (databaseController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              collapsedHeight: 2,
              toolbarHeight: 0,
              elevation: 0,
              backgroundColor: AlHadithColors.navGreen,
              flexibleSpace: FlexibleAppBar(
                  titleText: databaseController.booksList[0]['title'] ?? '',
                  subTitleText:
                      databaseController.chaptersList[0]['title'] ?? ''),
              pinned: true,
              expandedHeight: 60,
              clipBehavior: Clip.hardEdge,
            ),
            SliverToBoxAdapter(
              child: Material(
                color: AlHadithColors.scaffoldColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    children: [
                      HadithHeaderBox(
                        sectionNumberText:
                            "${databaseController.sectionsList[0]['number']} ",
                        sectionTitleText: databaseController.sectionsList[0]
                            ['title'],
                        sectionPrefaceText: databaseController.sectionsList[0]
                            ['preface'],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      HadithDetailsBox(
                        abvrCode: databaseController.booksList[0]['abvr_code'],
                        bookTitle: databaseController.booksList[0]['title'],
                        hadithId: databaseController.hadithList[0]['hadith_id'],
                        hadithAr: databaseController.hadithList[0]['ar'],
                        hadithNarrator: databaseController.hadithList[0]
                            ['narrator'],
                        hadithBn: databaseController.hadithList[0]['bn'],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

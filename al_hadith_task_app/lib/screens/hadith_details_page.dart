import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/books_controller.dart';
import '../controllers/chapter_controller.dart';
import '../controllers/hadith_controller.dart';
import '../controllers/section_controller.dart';


class HadithDetailsPage extends StatelessWidget {
  final BooksController booksController = Get.put(BooksController());
  final ChapterController chapterController = Get.put(ChapterController());
  final SectionController sectionController = Get.put(SectionController());
  final HadithController hadithController = Get.put(HadithController());

  HadithDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hadith Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (booksController.isLoading.value) {
                return CircularProgressIndicator();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Books',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  for (var book in booksController.booksList)
                    ListTile(
                      title: Text(book['title'] ?? ''),
                      subtitle: Text(book['abvr_code'] ?? ''),
                    ),
                ],
              );
            }),

            Obx(() {
              if (chapterController.isLoading.value) {
                return CircularProgressIndicator();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chapters',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  for (var chapter in chapterController.chaptersList)
                    ListTile(
                      title: Text(chapter['title'] ?? ''),
                      subtitle: Text(chapter['hadis_range'] ?? ''),
                    ),
                ],
              );
            }),

            Obx(() {
              if (sectionController.isLoading.value) {
                return CircularProgressIndicator();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sections',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  for (var section in sectionController.sectionsList)
                    ListTile(
                      title: Text(section['title'] ?? ''),
                      subtitle: Text(section['number']?.toString() ?? ''),
                    ),
                ],
              );
            }),

            Obx(() {
              if (hadithController.isLoading.value) {
                return CircularProgressIndicator();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hadith',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  for (var hadith in hadithController.hadithList)
                    ListTile(
                      title: Text(hadith['narrator'] ?? ''),
                      subtitle: Text(hadith['ar'] ?? ''),
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
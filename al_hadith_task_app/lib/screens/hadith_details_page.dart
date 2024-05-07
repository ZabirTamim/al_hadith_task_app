import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/books_controller.dart';
import '../controllers/chapter_controller.dart';
import '../controllers/hadith_controller.dart';
import '../controllers/section_controller.dart';
import '../models/books.dart';
import '../models/chapter.dart';
import '../models/hadith.dart';
import '../models/section.dart';


class HadithDetailsPage extends StatelessWidget {
  final ChapterController chapterController = Get.put(ChapterController());
  final BooksController booksController = Get.put(BooksController());
  final HadithController hadithController = Get.put(HadithController());
  final SectionController sectionController = Get.put(SectionController());

  HadithDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hadith App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chapter List
            Obx(() {
              if (chapterController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chapters',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: chapterController.chapterList.length,
                    itemBuilder: (context, index) {
                      Chapter chapter = chapterController.chapterList[index];
                      return ListTile(
                        title: Text(chapter.title ?? ''),
                        subtitle: Text(chapter.bookName ?? ''),
                      );
                    },
                  ),
                ],
              );
            }),

            // Books List
            Obx(() {
              if (booksController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Books',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: booksController.booksList.length,
                    itemBuilder: (context, index) {
                      Books books = booksController.booksList[index];
                      return ListTile(
                        title: Text(books.title ?? ''),
                        subtitle: Text(books.bookName ?? ''),
                      );
                    },
                  ),
                ],
              );
            }),

            // Hadith List
            Obx(() {
              if (hadithController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hadith',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: hadithController.hadithList.length,
                    itemBuilder: (context, index) {
                      Hadith hadith = hadithController.hadithList[index];
                      return ListTile(
                        title: Text(hadith.narrator ?? ''),
                        subtitle: Text(hadith.ar ?? ''),
                      );
                    },
                  ),
                ],
              );
            }),

            // Section List
            Obx(() {
              if (sectionController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sections',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: sectionController.sectionList.length,
                    itemBuilder: (context, index) {
                      Section section = sectionController.sectionList[index];
                      return ListTile(
                        title: Text(section.title ?? ''),
                        subtitle: Text(section.preface ?? ''),
                      );
                    },
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

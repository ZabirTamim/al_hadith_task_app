


import 'package:al_hadith_task_app/const/color_const.dart';
import 'package:al_hadith_task_app/const/text_style_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gui_shape/geo/geo_common.dart';
import 'package:gui_shape/gui/gui_shape_border.dart';
import 'package:gui_shape/shape/gui_shape_polygon.dart';

import '../controllers/database_controller.dart';

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
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            color: AlHadithColors.navTextWhite,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 7,
                              left: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(databaseController.booksList[0]['title'] ?? '',
                                    style: AlHadithTextStyle().headerText),
                                Text(
                                  databaseController.chaptersList[0]['title'] ?? '',
                                  style: AlHadithTextStyle().smallText,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.menu_outlined,
                        color: AlHadithColors.navTextWhite,
                      )
                    ],
                  ),
                ),
              ),
              pinned: true,
              expandedHeight: 60,
              clipBehavior: Clip.hardEdge,
            ),
            SliverToBoxAdapter(
              child: Material(
                color: AlHadithColors.scaffoldColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    children: [
                      Material(
                        color: AlHadithColors.navTextWhite,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: '১/১. অধ্যায়: ',
                                  style: AlHadithTextStyle()
                                      .headerText
                                      .copyWith(color: AlHadithColors.sectionNumberTextGreen),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                        'আল্লাহু রাসূল ( সাল্লাল্লাহু আলাইহি ওয়া সাল্লাম)- এর প্রতী কিভাবে ওয়াহী [১] শুরু হয়েছিল। ',
                                        style: AlHadithTextStyle().headerText.copyWith(
                                            color: AlHadithColors.sectionTitleTextGrey,
                                            fontSize: 17)),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 15),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Divider(
                                    color:
                                    AlHadithColors.sectionTitleTextGrey,
                                  ),
                                ),
                              ),
                              Text(
                                databaseController.sectionsList[0]['number'].toString(),
                                style: AlHadithTextStyle().smallText.copyWith(
                                    color:
                                    AlHadithColors.arabicBlack.withOpacity(0.5),
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: GuiShapeBorder(
                                            shape: GuiShapePolygon(
                                              sides: 6,
                                              cornerRadius: 3,
                                              startAngle: GeoAngle(degree: 90),
                                            ),
                                          ),
                                          minimumSize: const Size(35, 55),
                                          backgroundColor: AlHadithColors.abvrGreen,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          databaseController.booksList[0]['abvr_code'] ?? '',
                                          style: const TextStyle(
                                              color: AlHadithColors.navTextWhite,
                                              fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(databaseController.booksList[0]['title'] ?? '',
                                              style: AlHadithTextStyle().mediumText),
                                          Text(
                                            "হাদিস: ১",
                                            style: AlHadithTextStyle().headerText.copyWith(
                                                color: AlHadithColors.hadithNumberGreen),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Material(
                                        color: AlHadithColors.hadithGradeGreen,
                                        borderRadius: BorderRadius.circular(15),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 12),
                                          child: Center(
                                            child: Text(
                                              "সহিহ হাদিস",
                                              style: AlHadithTextStyle().smallText,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        CupertinoIcons.ellipsis_vertical,
                                        color: AlHadithColors.sectionPrefaceTextGrey,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                  databaseController.hadithList[0]['ar'] ?? '',                                  textAlign: TextAlign.right,
                                  style: AlHadithTextStyle().arabicText),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  databaseController.hadithList[0]['narrator'] ?? "",
                                  style: AlHadithTextStyle().headerText.copyWith(color: AlHadithColors.sectionNumberTextGreen)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  databaseController.hadithList[0]['bn'] ?? '',
                                  style: AlHadithTextStyle().headerText.copyWith(fontWeight:FontWeight.normal,color: AlHadithColors.arabicBlack)),
                            ],
                          ),
                        ),
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gui_shape/geo/geo_common.dart';
import 'package:gui_shape/gui/gui.dart';
import '../const/color_const.dart';
import '../const/text_style_const.dart';

class HadithDetailsBox extends StatelessWidget {
  final String abvrCode;
  final String bookTitle;
  final int hadithId;
  final String hadithAr;
  final String hadithNarrator;
  final String hadithBn;

  const HadithDetailsBox(
      {super.key,
      required this.abvrCode,
      required this.bookTitle,
      required this.hadithId,
      required this.hadithAr,
      required this.hadithNarrator,
      required this.hadithBn});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Material(
                      color: AlHadithColors.abvrGreen,
                      shape: GuiShapeBorder(
                        shape: GuiShapePolygon(
                          sides: 6,
                          cornerRadius: 2,
                          startAngle: GeoAngle(degree: 90),
                        ),
                      ),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Text(
                            abvrCode,
                            style: const TextStyle(
                                color: AlHadithColors.navTextWhite, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bookTitle, style: AlHadithTextStyle().mediumText),
                        Text(
                          "হাদিস: ${hadithId.toString()}",
                          style: AlHadithTextStyle().headerText.copyWith(
                              color: AlHadithColors.hadithNumberGreen),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                      color: AlHadithColors.hadithGradeGreen,
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: 30,
                        width: 80,
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
                    Icon(
                      CupertinoIcons.ellipsis_vertical,
                      color: AlHadithColors.sectionPrefaceTextGrey
                          .withOpacity(0.7),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(hadithAr,
                textAlign: TextAlign.right,
                style: AlHadithTextStyle().arabicText),
            const SizedBox(
              height: 10,
            ),
            Text("$hadithNarrator থেকে বর্ণিত: ",
                style: AlHadithTextStyle()
                    .headerText
                    .copyWith(color: AlHadithColors.sectionNumberTextGreen)),
            const SizedBox(
              height: 10,
            ),
            Text(hadithBn,
                style: AlHadithTextStyle().headerText.copyWith(
                    fontWeight: FontWeight.normal,
                    color: AlHadithColors.arabicBlack)),
          ],
        ),
      ),
    );
  }
}

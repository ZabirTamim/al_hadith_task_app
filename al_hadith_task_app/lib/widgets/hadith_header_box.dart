
import 'package:flutter/material.dart';

import '../const/color_const.dart';
import '../const/text_style_const.dart';

class HadithHeaderBox extends StatelessWidget {
  final String sectionNumberText;
  final String sectionTitleText;
  final String sectionPrefaceText;
  const HadithHeaderBox({super.key, required this.sectionNumberText, required this.sectionTitleText, required this.sectionPrefaceText});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AlHadithColors.navTextWhite,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: sectionNumberText,
                style: AlHadithTextStyle()
                    .headerText
                    .copyWith(
                    color: AlHadithColors
                        .sectionNumberTextGreen),
                children: <TextSpan>[
                  TextSpan(
                      text:
                      sectionTitleText,
                      style: AlHadithTextStyle()
                          .headerText
                          .copyWith(
                          color: AlHadithColors
                              .sectionPrefaceTextGrey,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: double.infinity,
                child: Divider(
                  color: AlHadithColors.sectionTitleTextGrey.withOpacity(0.2),
                ),
              ),
            ),
            Text(
              sectionPrefaceText,
              style: AlHadithTextStyle().smallText.copyWith(
                  color: AlHadithColors.sectionTitleTextGrey,
                  fontSize: 15, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}



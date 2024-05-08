import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../const/color_const.dart';
import '../const/text_style_const.dart';

class FlexibleAppBar extends StatelessWidget {
  final String titleText;
  final String subTitleText;
  const FlexibleAppBar({
    super.key, required this.titleText, required this.subTitleText,
  });


  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
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
                    left: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(titleText,
                          style: AlHadithTextStyle().headerText),
                      Text(
                        subTitleText,
                        style: AlHadithTextStyle().smallText,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Icon(
              CupertinoIcons.slider_horizontal_3,
              color: AlHadithColors.navTextWhite,
            )
          ],
        ),
      ),
    );
  }
}
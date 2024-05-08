
import 'package:al_hadith_task_app/const/color_const.dart';
import 'package:flutter/material.dart';

class AlHadithTextStyle {
  TextStyle headerText =  const TextStyle(color: AlHadithColors.navTextWhite,fontSize: 18,fontWeight: FontWeight.w600,overflow: TextOverflow.clip,fontFamily: 'Kalpurush');
  TextStyle mediumText =  const TextStyle(color: AlHadithColors.sectionTitleTextGrey,fontSize: 15,fontWeight: FontWeight.w600,overflow: TextOverflow.clip,fontFamily: 'kalpurush');
  TextStyle smallText =  const TextStyle(color: Colors.white,fontSize: 13,overflow: TextOverflow.clip,fontFamily: 'kalpurush');
  TextStyle arabicText =  const TextStyle(color: AlHadithColors.arabicBlack,fontSize: 26,overflow: TextOverflow.clip,fontFamily: 'KFGQ');

}
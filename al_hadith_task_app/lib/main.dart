import 'package:al_hadith_task_app/const/color_const.dart';
import 'package:al_hadith_task_app/screens/hadith_details_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al Hadith',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AlHadithColors.navGreen),
        useMaterial3: true,
      ),
      home: HadithDetailsPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagram_clone_application/consts/colors.dart';
import 'package:instagram_clone_application/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
            headlineLarge: TextStyle(
              fontSize: 16,
              color: kWhite,
              fontFamily: 'Gilroy-Bold',
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                color: kWhite,
                fontSize: 16,
                fontFamily: 'Gilroy-Bold',
              ),
              backgroundColor: kPink,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

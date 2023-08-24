import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instagram_clone_application/consts/colors.dart';
import 'package:instagram_clone_application/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kDark,
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage('images/pattern 1.png'),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Center(
                child: Image(
                  image: AssetImage('images/Startlogo.png'),
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              child: Column(
                children: [
                  Text(
                    'From',
                    style: TextStyle(color: kGrey),
                  ),
                  Text(
                    'ExpertFlutter',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

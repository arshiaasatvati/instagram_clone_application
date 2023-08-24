import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone_application/consts/colors.dart';

class SwitchAccountPage extends StatelessWidget {
  const SwitchAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1C1F2E),
        image: DecorationImage(
            opacity: 0.5,
            image: AssetImage('images/pattern 1.png'),
            repeat: ImageRepeat.repeat),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage('images/switch_account_background.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10,
                        ),
                        child: Container(
                          width: 330,
                          height: 340,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.5),
                                Color.fromRGBO(255, 255, 255, 0.2)
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 24),
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/profile.png'),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              SizedBox(height: 24),
                              Text(
                                'AmirAhmadAdibi',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              SizedBox(height: 24),
                              SizedBox(
                                width: 130,
                                height: 46,
                                child: ElevatedButton(
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style,
                                  onPressed: () {},
                                  child: Text(
                                    'Confirm',
                                  ),
                                ),
                              ),
                              SizedBox(height: 32),
                              Text(
                                'switch account',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 63, top: 110),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? / ',
                    style: TextStyle(
                      color: kGrey,
                      fontSize: 16,
                      fontFamily: 'Gilroy-Bold',
                    ),
                  ),
                  Text(
                    'Sign up',
                    style: Theme.of(context).textTheme.headlineLarge,
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

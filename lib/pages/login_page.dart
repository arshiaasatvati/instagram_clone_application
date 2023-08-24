import 'package:flutter/material.dart';
import 'package:instagram_clone_application/consts/colors.dart';
import 'package:instagram_clone_application/pages/switch_account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode myFocusNodeEmail = FocusNode();
  FocusNode myFocusNodePassword = FocusNode();
  bool visiblePassword = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNodeEmail.addListener(() {
      setState(() {});
    });
    myFocusNodePassword.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff323A99),
            Color(0xffF98BFC),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              top: 60,
              bottom: 0,
              left: 0,
              right: 0,
              child: _getImageContainer(),
            ),
            Positioned(
              child: _getDetailsBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getImageContainer() {
    return Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage('images/rocket.png'),
          ),
        ),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }

  Widget _getDetailsBox() {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: kDark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: double.infinity),
                  SizedBox(height: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign in to  ',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Gilroy-Bold',
                          color: kWhite,
                        ),
                      ),
                      Image(
                        image: AssetImage('images/moodinger.png'),
                      )
                    ],
                  ),
                  SizedBox(height: 32),
                  _getTextFields(),
                  SizedBox(height: 32),
                  SizedBox(
                    width: 129,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SwitchAccountPage(),
                          ),
                        );
                      },
                      child: Text('sign in'),
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have and account? / ',
                        style: TextStyle(
                          color: kGrey,
                          fontFamily: 'Gilroy-Bold',
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Sign up',
                        style: TextStyle(
                          color: kWhite,
                          fontFamily: 'Gilroy-Bold',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getTextFields() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42),
          child: SizedBox(
            height: 46,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              focusNode: myFocusNodeEmail,
              cursorColor: kWhite,
              maxLines: 1,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                fontFamily: 'Gilroy-Medium',
                color: kWhite,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontFamily: 'Gilroy-Medium',
                  fontSize: 16,
                  color: myFocusNodeEmail.hasFocus ? kPink : kGrey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: kGrey, width: 2.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: kPink, width: 2.5),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42),
          child: SizedBox(
            height: 46,
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              focusNode: myFocusNodePassword,
              cursorColor: kWhite,
              maxLines: 1,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                fontFamily: 'Gilroy-Medium',
                color: kWhite,
                fontSize: 14,
              ),
              obscureText: visiblePassword,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      visiblePassword = !visiblePassword;
                    });
                  },
                  icon: Icon(
                    visiblePassword ? Icons.visibility : Icons.visibility_off,
                    color: kGrey,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontFamily: 'Gilroy-Medium',
                  fontSize: 16,
                  color: myFocusNodePassword.hasFocus ? kPink : kGrey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: kGrey, width: 2.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: kPink, width: 2.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    myFocusNodeEmail.dispose();
    myFocusNodePassword.dispose();
    super.dispose();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flashchat/Componets/rounded_buttons.dart';

class WelcomeScreen extends StatefulWidget {
//  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;

  Animation animation1;

  // Animation animation2;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        upperBound: 1, vsync: this, duration: Duration(seconds: 1));
    controller.forward();
    animation1 = CurvedAnimation(parent: controller, curve: Curves.decelerate);
// animation2 = ColorTween(begin: Colors.grey, end: Colors.lightBlueAccent).animate(controller)
    controller.addListener(() {
      setState(() {});
    });
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser();
    if (user != null) {
      Navigator.pushNamed(context, 'chat_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    return Scaffold(
      // backgroundColor:
      //     Color(0XFF4dd0e1).withOpacity(0.90), // withOpacity(controller.value),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(8, 6, 15, 0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Hero(
                        tag: 'logo',
                        child: Container(
                          child: Image.asset(
                            'images/logo.png',
                            height: animation1.value * 70,
                          ),
                        ),
                      ),
                    ),
                    TypewriterAnimatedTextKit(
                      text: ['Flash Chat'],
                      textAlign: TextAlign.start,
                      speed: Duration(milliseconds: 555),
                      textStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 130,
                    ),
                  ],
                ),
              ),
              RoundedButtons(
                text: 'Login',
                colour: Colors.blueAccent,
                //Color(0xFF00e676),
                onpressed: () {
                  Navigator.pushNamed(context, 'login_page');
                },
              ),
              SizedBox(
                height: 5,
              ),
              RoundedButtons(
                text: 'Regsiter',
                colour: Colors.redAccent,
                onpressed: () {
                  Navigator.pushNamed(context, 'register_page');
                },
              ),
              SizedBox(
                height: 50,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

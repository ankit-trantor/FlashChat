//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/Screens/Welcome_screen.dart';
import 'package:flashchat/Screens/chat_screen.dart';
import 'package:flashchat/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/Screens/register_page.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
//  final _auth = FirebaseAuth.instance;

//  String initialPage(String c, String w) {
//    try {
//      String screen = _auth.currentUser() == null ? w : c;
//      print(_auth.currentUser());
//      return screen;
//    } catch (e) {
//      return w;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'login_page': (context) => LoginPage(),
        'register_page': (context) => RegisterPage(),
        'chat_page': (context) => ChatScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xFF374046),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();

  bool visibletext;
  final _auth = FirebaseAuth.instance;
  bool showspinner = false;
  String email;
  String password;
  @override
  void initState() {
    super.initState();
    visibletext = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      // backgroundColor: Color(0XFF4dd0e1).withOpacity(0.90),
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 200,
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Register Here !',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.white70),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 140,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  color: Colors.orange.shade400.withOpacity(0.85),
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (value) {
                            if (!value.contains('@')) {
                              return 'Enter a valid Email';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                              hintText: 'Enter your Email',
                              hintStyle:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              contentPadding: EdgeInsets.all(20)),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                      Expanded(
                        child: TextFormField(
                          obscureText: visibletext,
                          onChanged: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value.length < 6) {
                              return 'Password must be atleast 6 characters';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      visibletext = false;
                                    });
                                  },
                                  icon: Icon(Icons.visibility)),
                              prefixIcon: Icon(Icons.lock),
                              border: InputBorder.none,
                              hintText: "Create a New Password",
                              hintStyle:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              contentPadding: EdgeInsets.all(20)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Material(
                elevation: 15,
                color: Colors.redAccent.withOpacity(0.95),
                borderRadius: BorderRadius.circular(20),
                child: MaterialButton(
                  onPressed: () async {
                    setState(() {
                      if (formkey.currentState.validate() == true) {
                        showspinner = true;
                      }
                    });
                    try {
                      final newuser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      Navigator.pushReplacementNamed(context, 'login_page');
                      if (newuser != null) {
                        Navigator.pushReplacementNamed(context, 'chat_page');
                      }
                      setState(() {
                        showspinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  minWidth: 150,
                  height: 10,
                  child: Text(
                    'Register ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

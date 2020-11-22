import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showspinner = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: ModalProgressHUD(
          inAsyncCall: showspinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 110.0, horizontal: 30),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kalam'),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 4,
                        height: 5,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          hintText: "Enter your email.",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                        height: 4,
                      ),
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RaisedButton(
                          onPressed: () async {
                            setState(() {
                              showspinner = true;
                            });
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (user != null) {
                                Navigator.pushNamed(context, 'chat_screen');
                              }
                              setState(() {
                                showspinner = false;
                              });
                            } catch (e) {
                              print(e);
                            }
                          },
                          textColor: Colors.black,
                          child: Text("Login"),
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(
            begin: Colors.white, end: Colors.deepOrange.withOpacity(0.65))
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
        controller.value;
        animation.value;
      });
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white.withOpacity(controller.value),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 170),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Pettogram",
                      style: TextStyle(
                        fontFamily: 'Kalam',
                        fontSize: 50,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    TypewriterAnimatedTextKit(
                      totalRepeatCount: 1,
                      text: ["An official social media for pet lovers."],
                      textStyle: TextStyle(
                        letterSpacing: 2.5,
                        color: Colors.grey.shade500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 350,
                      child: FlatButton(
                        splashColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, 'login_screen');
                        },
                        child: Text(
                          "Login",
                        ),
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      child: FlatButton(
                        splashColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, 'signup_screen');
                        },
                        child: Text("Register"),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

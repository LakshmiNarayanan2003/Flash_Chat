import 'package:chat_app/screen/chat_screen.dart';
import 'package:chat_app/screen/login_screen.dart';
import 'package:chat_app/screen/signup_screen.dart';
import 'package:chat_app/screen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home': (context) => home(),
      'login_screen': (context) => Login(),
      'chat_screen': (context) => ChatScreen(),
      'signup_screen': (context) => Signup(),
    },
  ));
}

import 'package:chatapp/chat_screens/chat_users/chatUser.dart';
import 'package:chatapp/chat_screens/chat_users/userBubble.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/screens/splash.dart';

import 'chat_screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mega',
      theme: ThemeData(
        fontFamily: 'LexendDeca',
      ),
      home: ChatUser(),
    );
  }
}

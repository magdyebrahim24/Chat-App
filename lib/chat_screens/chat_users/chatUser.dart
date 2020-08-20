import 'package:chatapp/chat_screens/chat_users/chatUserStreamBuilder.dart';
import 'package:chatapp/models/user.dart';
import 'package:chatapp/sign/sign-in.dart';
import 'package:chatapp/widgets/buttons.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class ChatUser extends StatefulWidget {
  @override
  _ChatUserState createState() => _ChatUserState();
}

class _ChatUserState extends State<ChatUser> {
  @override
  void initState() {
    gerCurrentUser();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Mega',
          style: KMegaText.copyWith(color: secondaryColor, fontSize: 28),
        ),
        leading: CircleButton(
          icn: Icons.arrow_back_ios,
          clor: backgroundColor,
          fun: () {
            auth.signOut();
//            UserInfo().auth.signOut();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          },
        ),
        centerTitle: true,
      ),
      body : ChatUserStreamBuilder()
    );
  }
}

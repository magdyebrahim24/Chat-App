import 'package:chatapp/chat_screens/chat_users/userBubble.dart';
import 'package:chatapp/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class ChatUserStreamBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                'there is no users yet',
                style: KTextFormStyle.copyWith(
                    color: primaryColor.withOpacity(.7)),
              ),
            );
          }

          final users = snapshot.data.documents;
          List<UserBubble> userBubbles = [];
          for (var user in users) {
            final userName = user.data['userName'];
            final lastMessage = user.data['email'];
            final userBubble =
                UserBubble(userName: userName, lastMessage: lastMessage);

            userBubbles.add(userBubble);
          }
          return ListView(
            padding: EdgeInsets.symmetric(vertical: 10),
              children: userBubbles,
          );
        });
  }
}

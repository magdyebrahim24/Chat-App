import 'package:chatapp/constants.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({this.text, this.sender,this.isMe});
  final String text;
  final String sender;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start ,
        children: <Widget>[
          Text('$sender'),
          Material(
            elevation: 5.0,
            borderRadius: isMe ?
            BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ) : BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: isMe ?   primaryColor.withOpacity(.7) : Colors.teal[300].withOpacity(.8),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Text(
                '$text',
                style: KTextFormStyle.copyWith(
                    color: secondaryColor.withOpacity(.95)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

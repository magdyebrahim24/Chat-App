import 'package:flutter/material.dart';

import '../../constants.dart';

class UserBubble extends StatelessWidget {
  UserBubble({this.userName, this.lastMessage});
  final String userName;
  final String lastMessage;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRect(
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
//              image: DecorationImage( image: AssetImage('assets/profile-img.png'), fit: BoxFit.cover, ),
                  color: primaryColor,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userName,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      lastMessage,
//                    'if i saw you i will kill you can you understand me',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 15, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'now',
                  style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: 1,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey[300],
      )
    ]);
  }
}

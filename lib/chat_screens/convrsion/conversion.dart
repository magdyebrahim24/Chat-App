import 'package:chatapp/constants.dart';
import 'package:chatapp/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/sign/sign-in.dart';
import 'package:chatapp/models/user.dart';
import 'message/message-stream-builder.dart';



class Conversion extends StatefulWidget {
  @override
  _ConversionState createState() => _ConversionState();
}

class _ConversionState extends State<Conversion> {
  final _auth = FirebaseAuth.instance;
  final messageController = TextEditingController();
  String messageText;
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
            _auth.signOut();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          },
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MessageStreamBuilder(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
              ),
              elevation: 6.0,
              child: Row(
                children: <Widget>[
                  CircleButton(icn: Icons.mic, fun: () {},clor: primaryColor,),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          messageText = value;
                        });
                      },
                      controller: messageController,
                      maxLines: 4,
                      minLines: 1,
                      keyboardType: TextInputType.text,
                      style: KTextFormStyle,
                      decoration: kTextFormDecrotion.copyWith(
                        hintText: 'Enter Your Message',
                      ),
                    ),
                  ),
                  CircleButton(
                    icn: Icons.send,
                    clor: primaryColor,
                    fun: () {
                      firestore.collection('messages').add(
                          {'text': messageText, 'sender': loggedInUser.email});
                      messageController.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

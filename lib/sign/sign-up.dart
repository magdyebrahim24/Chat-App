import 'package:chatapp/chat_screens/chat_users/chatUser.dart';
import 'package:chatapp/models/user.dart';
import 'package:chatapp/widgets/dots-progres-inductor.dart';
import 'package:chatapp/widgets/buttons.dart';
import 'package:chatapp/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/chat_screens/convrsion/conversion.dart';
import 'package:chatapp/sign/sign-in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;
  bool _showSpinner = false;

  _getEmailFunction(String email) {
    setState(() {
      this.email = email.trim();
    });
  }

  _getPasswordFunction(String password) {
    setState(() {
      this.password = password.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .1,
                        bottom: MediaQuery.of(context).size.height * .1),
                    child: Text(
                      'Mega',
                      style: KMegaText,
                    ),
                  ),
                  TextFrmField(
                    inputTextFunction: _getEmailFunction,
                    icon: Icons.mail_outline,
                    hintText: 'NewEmail@mega.com',
                    obSecure: false,
                    showPasswordIcon: false,
                    textInptType: TextInputType.emailAddress,
                    error: false,
                    errorBorderColor: errorColor,
                    errorText: 'sddvdv',
                  ),
                  TextFrmField(
                    inputTextFunction: _getPasswordFunction,
                    icon: Icons.lock_outline,
                    hintText: 'Enter New Password',
                    obSecure: true,
                    showPasswordIcon: true,
                    error: false,
                    errorBorderColor: errorColor,
                    errorText: 'sddvdv',
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 20,
                        top: MediaQuery.of(context).size.height * .1),
                    child: RoundedButton(
                      text: 'Sign Up',
                      fun: () async {
                        setState(() {
                          _showSpinner = true;
                        });
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatUser(),
                              ),
                            );
                            firestore.collection('users').add({
                              'email': email,
                              'password': password,
//                              'userId': loggedInUser.uid,
                              'userName': 'magdy'
                            });
                          }
                          setState(() {
                            _showSpinner = false;
                          });
                        } catch (e) {
                          _showSpinner =false ;
                          print(e);
                        }
                        print('${email + password}');
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account ",
                        style: TextStyle(
                          color: primaryColor.withOpacity(.8),
                          fontSize: 15,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn())),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
          _showSpinner == true ? DotsProgressInductoor() : SizedBox(),
        ],
      ),
    );
  }
}

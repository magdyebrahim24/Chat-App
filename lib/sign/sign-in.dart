import 'package:chatapp/chat_screens/chat_users/chatUser.dart';
import 'package:chatapp/chat_screens/convrsion/conversion.dart';
import 'package:chatapp/sign/sign-up.dart';
import 'package:chatapp/widgets/dots-progres-inductor.dart';
import 'package:chatapp/widgets/buttons.dart';
import 'package:chatapp/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapp/chat_screens/home.dart';



class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool _showSpinner = false;
  bool _emailFormError = false;
  bool _passswordFormError = false;
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

  _checkPasswordAndEmailError() async {
    if (email == null || email.length == 0) {
      setState(() {
        _emailFormError = true;
        _showSpinner = false;
      });
    } else if (password == null || password.length <= 7) {
      setState(() {
        _passswordFormError = true;
        _showSpinner = false;
      });
    } else {
      setState(() {
        _passswordFormError = false;
        _emailFormError = false;
        _showSpinner = true;
      });
      try {
        final newUser =
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (newUser != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Conversion(),
            ),
          );
        } else {
          setState(() {
            _showSpinner = false;
          });
          _checkPasswordAndEmailError();
        }
      } catch (e) {
        print(e);
      }
    }
//                        _checkPasswordAndEmailError(textFormError);
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
                    hintText: 'Email@mega.com',
                    obSecure: false,
                    showPasswordIcon: false,
                    textInptType: TextInputType.emailAddress,
                    error: _emailFormError,
                    errorText: email == null || email.length == 0
                        ? 'Please Enter Email'
                        : '',
                    errorBorderColor: email == null
                        ? Colors.transparent
                        : email.length == 0 ? errorColor : Colors.transparent,
                  ),
//                  TextFormField(
//                    decoration: InputDecoration(
//                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
//                      labelText: 'Enter Name Here',
//                      hintText: 'Enter Name Here',
//                    ),
//                    autofocus: false,
//                    cursorColor: primaryColor,
//
//
//                  ),
                  TextFrmField(
                    inputTextFunction: _getPasswordFunction,
                    icon: Icons.lock_outline,
                    hintText: 'Enter Your Password',
                    obSecure: true,
                    showPasswordIcon: true,
                    error: _passswordFormError,
                    errorText: password == null || password.length == 0
                        ? 'Please Enter Password'
                        : password.length <= 7
                            ? 'Password Must Be 8 Letters Or More'
                            : '',
                    errorBorderColor: password == null
                        ? Colors.transparent
                        : password.length == 0
                            ? errorColor
                            : password.length <= 7
                                ? errorColor
                                : Colors.transparent,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 20,
                        top: MediaQuery.of(context).size.height * .1),
                    child: RoundedButton(
                      text: 'Sign In',
                      fun: _checkPasswordAndEmailError,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account ",
                        style: TextStyle(
                          color: primaryColor.withOpacity(.8),
                          fontSize: 15,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp())),
                        child: Text(
                          'Sign Up',
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
          _showSpinner ? DotsProgressInductoor() : SizedBox(),
        ],
      ),
    );
  }
}

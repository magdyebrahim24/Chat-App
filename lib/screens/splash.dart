import 'package:flutter/material.dart';
import 'package:chatapp/sign/sign-in.dart';
import 'dart:async';
import 'package:chatapp/constants.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignIn(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Mega',
          style: KMegaText,
        ),
      ),
//      body: Container(
//        width: MediaQuery.of(context).size.width,
//        height: MediaQuery.of(context).size.height,
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            image: AssetImage(
//              'assets/full-bloom.png',
//            ),
//            fit: BoxFit.cover,
//          ),
//        ),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Image(
//              image: AssetImage('assets/logo.png'),
//              height: 140,
//              width: 130,
//              fit: BoxFit.contain,
//            ),
//            Text(
//              'MEGA',
//              style: TextStyle(
//                color: Colors.teal,
//                fontSize: 40,
//                fontFamily: 'LobsterTwo',
//              ),
//            ),
//          ],
//        ),
//      ),
    );
  }
}

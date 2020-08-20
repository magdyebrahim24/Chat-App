import 'package:flutter/material.dart';
import 'package:chatapp/constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key key, this.fun, this.text}) : super(key: key);

  @required
  final String text;
  final Function fun;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 45,
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 55),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
      ),
      color: primaryColor,
      onPressed: fun,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

// ignore: must_be_immutable
class CircleButton extends StatelessWidget {
  CircleButton({
    this.icn,
    this.fun,
    this.clor,
  });
  final Color clor ;
  final IconData icn;
  Function fun;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 3.0,
      hoverElevation: 5.0,
      splashColor: primaryColor.withOpacity(.65),
      minWidth: 20,
      height: 45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      onPressed: fun,
      child: Icon(
        icn,
        color: clor,
      ),
    );
  }
}

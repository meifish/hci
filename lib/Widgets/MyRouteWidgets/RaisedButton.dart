import 'package:flutter/material.dart';

class RaisedCyanButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  RaisedCyanButton({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: child,
        onPressed: onPressed,
        textColor: Colors.white,
        color: Colors.cyan[600],
        splashColor: Colors.cyanAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}

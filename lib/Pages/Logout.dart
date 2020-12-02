import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/elevator1.jpg"),
                    fit: BoxFit.cover)),
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(80.0, 40.0, 40.0, 40.0),
                  child: Text("Logged out.",
                      style: TextStyle(fontSize: 30)),
                ),
              ),
            )));
  }
}
import 'package:flutter/material.dart';

class ShareAccessPage extends StatefulWidget {
  @override
  _ShareAccessPageState createState() => _ShareAccessPageState();
}

class _ShareAccessPageState extends State<ShareAccessPage> {
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
                  child: Text("Share Access is implemented in Prototype 1.",
                      style: TextStyle(fontSize: 30)),
                ),
              ),
            )));
  }
}

import 'package:flutter/material.dart';

class DoorHoldingTime extends StatefulWidget {
  String option = 'regular';
  DoorHoldingTime({Key key}) : super(key: key);

  @override
  _DoorHoldingTimeState createState() => _DoorHoldingTimeState();
}

class _DoorHoldingTimeState extends State<DoorHoldingTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Door Holding Time')),
      body: ListView(
        children: [
          ListTile(
            title: Text("Select your prefered door holding time"),
          ),
          ListTile(
            title: Text("Regular"),
            subtitle: Text("hold the door for 10 seconds"),
            tileColor: widget.option=='regular' ? Colors.blue[100] : Colors.white,
            onTap: () {
              setState(() {
                widget.option = 'regular';
              });
            },
          ),
          ListTile(
            title: Text("Long"),
            subtitle: Text("hold the door for 25 seconds"),
            tileColor: widget.option=='long' ? Colors.blue[100] : Colors.white,
            onTap: () {
              setState(() {
                widget.option = 'long';
              });
            },
          ),
        ],
      ),
    );
  }
}

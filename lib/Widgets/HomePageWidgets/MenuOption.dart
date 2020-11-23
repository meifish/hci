import 'package:flutter/material.dart';

class MenuOption extends StatefulWidget {
  String option;
  String route;

  MenuOption({@required this.option, @required this.route});

  @override
  _MenuOptionState createState() => _MenuOptionState();
}

class _MenuOptionState extends State<MenuOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.grey,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album, size: 70),
              title: Text(widget.option, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

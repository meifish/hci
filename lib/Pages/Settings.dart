import 'package:flutter/material.dart';

import '../Widgets/HomePageWidgets/MenuOption.dart';

class Settings extends StatefulWidget {
  Settings({Key key, this.title}):super(key: key);

  final String title; 
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/elevator1.jpg"),
                fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuOption(
                    option: 'Door Holding \ntime',
                    route: '/MyRoute',
                    icon: Icons.favorite),
                MenuOption(
                    option: 'My buildings',
                    route: '/MyRoute',
                    icon: Icons.elevator),
                MenuOption(
                    option: 'Add buildings',
                    route: '/MyRoute',
                    icon: Icons.share),
                MenuOption(
                  option: 'Log out',
                  route: '/MyRoute',
                  icon: Icons.settings, 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

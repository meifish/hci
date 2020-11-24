import 'package:flutter/material.dart';
import 'package:hci/Widgets/HomePageWidgets/MenuOption.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                    option: 'My Routes',
                    route: '/MyRoute',
                    icon: Icons.favorite),
                MenuOption(
                    option: 'Use An Elevator',
                    route: '/MyRoute',
                    icon: Icons.elevator),
                MenuOption(
                    option: 'Share Access',
                    route: '/MyRoute',
                    icon: Icons.share),
                MenuOption(
                  option: 'Setting',
                  route: '/Settings',
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    route: '/DoorHold',
                    icon: Icons.sensor_door),
                MenuOption(
                    option: 'My buildings',
                    route: '/MyBuildings',
                    icon: Icons.house_rounded),
                MenuOption(
                    option: 'Add buildings',
                    route: '/AddBuilding',
                    icon: Icons.add),
                LogOutOption(
                  option: 'Log out',
                  route: '/MyRoute',
                  icon: Icons.exit_to_app, 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogOutOption extends StatelessWidget {
  var icon;
  String option;
  String route;

  LogOutOption({this.icon, this.option, this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          color: Colors.white,
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Row(
              children: [
                Icon(icon, size: 60, color: Colors.red[300]),
                SizedBox(
                  width: 15,
                ),
                Text(option,
                    style: GoogleFonts.roboto(
                      color: Colors.red[300],
                      letterSpacing: 1,
                      fontSize: 30,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

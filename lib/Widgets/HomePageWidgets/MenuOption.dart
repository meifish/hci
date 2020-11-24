import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuOption extends StatefulWidget {
  var icon;
  String option;
  String route;

  MenuOption(
      {@required this.icon, @required this.option, @required this.route});

  @override
  _MenuOptionState createState() => _MenuOptionState();
}

class _MenuOptionState extends State<MenuOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, widget.route);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          color: Colors.cyan[600],
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Row(
              children: [
                Icon(widget.icon, size: 60, color: Colors.white),
                SizedBox(
                  width: 15,
                ),
                Text(widget.option,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
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

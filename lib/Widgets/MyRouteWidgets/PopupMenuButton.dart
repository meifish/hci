import 'package:flutter/material.dart';
import 'package:hci/Pages/RouteEditForm.dart';

class PopupMenu extends StatefulWidget {
  int index;
  List<Map<String, dynamic>> my_routes;

  PopupMenu({this.my_routes, this.index});

  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text(
            "Edit",
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Delete",
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RouteEditForm(
                      my_routes: widget.my_routes, index: widget.index)));
        }
      },
      offset: Offset(0, 100),
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      elevation: 4,
      padding: EdgeInsets.fromLTRB(0, 20, 10, 5),
    );
  }
}

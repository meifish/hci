import 'package:flutter/material.dart';
import 'package:hci/Pages/RouteEditForm.dart';
import 'package:hci/Model/RouteDBModel.dart';
import 'package:hci/Model/Route.dart';

class PopupMenu extends StatefulWidget {
  int index;
  List<Map<String, dynamic>> my_routes;
  final Function() callbackfunc;

  PopupMenu({this.my_routes, this.index, @required this.callbackfunc});

  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  final _model = RouteModel();

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
      onSelected: (value) async {
        if (value == 1) {
          final result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RouteEditForm(
                      my_routes: widget.my_routes,
                      index: widget.index,
                      callbackfunc: widget.callbackfunc)));
          Scaffold.of(context)
            ..showSnackBar(SnackBar(content: Text("$result")));
        }
        if (value == 2) {
          // delete from sql
          print("delete id");
          print(widget.my_routes[widget.index]["id"]);
          await _model.deleteRoute(widget.my_routes[widget.index]["id"]);
          widget.callbackfunc();
          setState(() {});
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

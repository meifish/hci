import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBuildings extends StatefulWidget {
  @override
  _MyBuildingsState createState() => _MyBuildingsState();
}

class _MyBuildingsState extends State<MyBuildings> {
  int selected = -1;

  deleteDialog(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("Are you sure you want to delete this building's access? "),
              Text(
                '(You will need to request the access code again)',
                style: GoogleFonts.roboto(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        actions: [
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My building list'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ListTile(
              title: Text("Condo"),
              subtitle: Text("Address: street #, City, Province, POSTAL"),
              trailing: Wrap(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteDialog(context);
                    },
                  ),
                ],
              ),
              // tileColor: selected == 0 ? Colors.blue[100] : Colors.white,
              // onTap: () {
              //   setState(() {
              //     selected = 0;
              //   });
              // },
            ),
            ListTile(
              title: Text("Work"),
              subtitle: Text("Address: street #, City, Province, POSTAL"),
              trailing: Wrap(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteDialog(context);
                    },
                  ),
                ],
              ),
              // tileColor: selected == 1 ? Colors.blue[100] : Colors.white,
              // onTap: () {
              //   setState(() {
              //     selected = 1;
              //   });
              // },
            ),
          ],
        ),
      ),
    );
  }
}

/*

class BuildingsTile extends StatefulWidget {
  String buildingName;
  String address;
  // int selected;

  BuildingsTile({this.buildingName, this.address});

  @override
  _BuildingsTileState createState() => _BuildingsTileState();
}

class _BuildingsTileState extends State<BuildingsTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.buildingName),
      subtitle: Text(widget.address),
      trailing: Wrap(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              deleteDialog(context);
            },
          ),
        ],
      ),
      // tileColor: Colors.white,
      // onTap: () {
      //   setState(() {
      //     widget.selected = 1;
      //   });
      // },
    );
  }

  deleteDialog(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("Are you sure you want to delete this building's access? "),
              Text(
                '(You will need to request the access code again)',
                style: GoogleFonts.roboto(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        actions: [
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

*/
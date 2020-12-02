import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hci/Model/Preference.dart';
import 'package:hci/Model/PreferenceDBModel.dart';
import 'package:hci/Pages/Settings/EditBuilding.dart';

class MyBuildings extends StatefulWidget {
  @override
  _MyBuildingsState createState() => _MyBuildingsState();
}

class _MyBuildingsState extends State<MyBuildings> {
  final _pmodel = PreferenceModel();
  Preference preference;
  List<String> buildings = [];
  int selected = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPref();
    // setState(() {
    // });
  }

  void loadPref() async {
    this.preference = await _pmodel.getPreference();
  }

  List<String> getBuildings() {
    if (preference != null) {
      this.buildings = preference.buildings;
      print('buildings: $buildings');
      print('been here');
      return preference.buildings;
    }
    return [];
  }

  deleteDialog(context, index) {
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
                style: GoogleFonts.roboto(color: Colors.grey[600]),
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
            onPressed: () async {
              this.buildings.removeAt(index);
              this.preference.buildings = buildings;
              await _pmodel.update(preference);
              print('been deleted');
              // this.buildings = buildings;
              // this.preference.buildings = buildings;
              setState(() {});
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<List<String>> _loadAll() async {
    this.preference = await _pmodel.getPreference();
    var buildn = this.preference.buildings;
    print('buildn: $buildn');
    return buildn;
  }

  @override
  Widget build(BuildContext context) {
    loadPref();
    this.buildings = getBuildings();
    print('buildings: $buildings');
    return Scaffold(
      appBar: AppBar(
        title: Text('My building list'),
      ),
      body: FutureBuilder(
          future: _loadAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var b = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: b.length,
                  itemBuilder: (BuildContext context, int i) {
                    return ListTile(
                      title: Text(b[i]),
                      subtitle:
                          Text("Address: street #, City, Province, POSTAL"),
                      trailing: Wrap(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () async {
                              List<String> newBuildings = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditBuilding(
                                          buildings: b, index: i)));
                              if (newBuildings != null) {
                                this.preference.buildings = newBuildings;
                                await _pmodel.update(preference);
                                setState(() {});
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              deleteDialog(context, i);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}

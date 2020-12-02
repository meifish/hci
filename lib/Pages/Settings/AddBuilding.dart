import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hci/Model/Preference.dart';
import 'package:hci/Model/PreferenceDBModel.dart';
import 'package:hci/Widgets/MyRouteWidgets/RaisedButton.dart';

class AddBuilding extends StatefulWidget {
  @override
  _AddBuildingState createState() => _AddBuildingState();
}

class _AddBuildingState extends State<AddBuilding> {
  final _pmodel = PreferenceModel();
  final _formkey = GlobalKey<FormState>();
  Preference preference;
  String building;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add a building access")),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Building Name",
                    hintText: "eg: Ann's Condo",
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(70)),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(70.0)),
                        borderSide: BorderSide(color: Colors.cyan)),
                  ),
                  onChanged: (String val) {
                    building = val;
                  },
                  // validator: (val) {return null;},
                  onSaved: (String val) async {
                    building = val;
                    preference = await _pmodel.getPreference();
                    if (preference != null) {
                      print('been here $val');
                      preference.buildings.add(val);
                      print('preference: $preference');
                      _pmodel.update(preference);
                      var p = await _pmodel.getPreference();
                      print(p);
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Access code",
                    hintText: "Access code from management or a friend",
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(70)),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(70.0)),
                        borderSide: BorderSide(color: Colors.cyan)),
                  ),
                  // validator: (val) {return null;},
                  onSaved: (String val) {
                    building = val;
                  },
                ),
                SizedBox(height: 10),
                Center(
                  child: RaisedCyanButton(
                    onPressed: () async {
                      _formkey.currentState.save();
                      Navigator.pop(context);
                      // preference = await _pmodel.getPreference();
                      // preference.buildings.add(building);
                      // _pmodel.update(preference);
                      // setState(() {});
                    },
                    child: Text(
                      "Add Access",
                      style: GoogleFonts.roboto(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

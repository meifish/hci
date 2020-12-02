import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hci/Model/Preference.dart';
import 'package:hci/Model/PreferenceDBModel.dart';
import 'package:hci/Widgets/MyRouteWidgets/RaisedButton.dart';

class EditBuilding extends StatefulWidget {
  List<String> buildings;
  int index;
  EditBuilding({Key key, this.buildings, this.index}):super(key: key);
  @override
  _EditBuildingState createState() => _EditBuildingState();
}

class _EditBuildingState extends State<EditBuilding> {
  // final _pmodel = PreferenceModel();
  final _formkey = GlobalKey<FormState>();
  // Preference preference;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Building Name")),
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
                      borderRadius: const BorderRadius.all(Radius.circular(70)),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(70.0)),
                      borderSide: BorderSide(color: Colors.cyan)),
                ),
                onSaved: (String val) async {
                  widget.buildings[widget.index] = val;
                },
              ),
              SizedBox(height: 10),
              Center(
                child: RaisedCyanButton(
                  onPressed: () async {
                    _formkey.currentState.save();
                    print(widget.buildings);
                    Navigator.pop(context, widget.buildings);
                  },
                  child: Text(
                    "Rename Building",
                    style: GoogleFonts.roboto(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

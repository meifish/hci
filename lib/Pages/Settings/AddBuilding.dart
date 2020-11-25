import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hci/Widgets/MyRouteWidgets/RaisedButton.dart';

class AddBuilding extends StatefulWidget {
  @override
  _AddBuildingState createState() => _AddBuildingState();
}

class _AddBuildingState extends State<AddBuilding> {
  final _formkey = GlobalKey<FormState>();
  String building;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add a building access")),
        body: Form(
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
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Access code",
                    hintText:
                        "Access code from management or a friend",
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(70)),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(70.0)),
                        borderSide: BorderSide(color: Colors.cyan)),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: RaisedCyanButton(
                    onPressed: () {},
                    child: Text("Add Access", style: GoogleFonts.roboto(fontSize: 20),),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

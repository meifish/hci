import 'package:flutter/material.dart';
import 'package:hci/Model/Preference.dart';
import 'package:hci/Model/PreferenceDBModel.dart';

class DoorHoldingTime extends StatefulWidget {
  String option = 'regular';
  DoorHoldingTime({Key key}) : super(key: key);

  @override
  _DoorHoldingTimeState createState() => _DoorHoldingTimeState();
}

class _DoorHoldingTimeState extends State<DoorHoldingTime> {
  final _pmodel = PreferenceModel();
  Preference preference;

  void loadPref() async {
    preference = await _pmodel.getPreference();
    if (preference != null) {
      setState(() {
        widget.option = preference.doorHoldT;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Door Holding Time')),
      body: ListView(
        children: [
          ListTile(
            title: Text("Select your prefered door holding time"),
          ),
          ListTile(
            title: Text("Regular"),
            subtitle: Text("hold the door for 10 seconds"),
            tileColor:
                widget.option == 'regular' ? Colors.blue[100] : Colors.white,
            onTap: () {
              setState(() {
                widget.option = 'regular';
                preference.doorHoldT = 'regular';
                _pmodel.update(preference);
              });
            },
          ),
          ListTile(
            title: Text("Long"),
            subtitle: Text("hold the door for 25 seconds"),
            tileColor:
                widget.option == 'long' ? Colors.blue[100] : Colors.white,
            onTap: () {
              setState(() {
                widget.option = 'long';
                preference.doorHoldT = 'long';
                _pmodel.update(preference);
              });
            },
          ),
        ],
      ),
    );
  }
}

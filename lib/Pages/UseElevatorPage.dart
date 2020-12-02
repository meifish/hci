import 'package:flutter/material.dart';
import 'package:hci/sizeConfig.dart';
import 'package:hci/Widgets/UseElevatorWidgets/ElevatorSummonDiag.dart';

class UseElevatorPage extends StatefulWidget {
  String floor = "44";
  String up_img = "assets/images/up_1.png";
  String down_img = "assets/images/down_1.png";
  String dropdownValue = "44";
  int slideval = 44;

  @override
  _UseElevatorPageState createState() => _UseElevatorPageState();
}

class _UseElevatorPageState extends State<UseElevatorPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Use Elevator'),
        ),
        body: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/elevator_button.webp"),
                    fit: BoxFit.cover)),
            child: Stack(children: [
              Positioned(
                  top: 40,
                  left: 40,
                  child: Row(children: [
                    Text(
                      "Change Floor",
                      style: TextStyle(color: Colors.white70, fontSize: 30),
                    ),
                    SizedBox(width: 30),
                    DropdownButton<String>(
                      value: widget.floor,
                      iconSize: 40,
                      elevation: 16,
                      style: TextStyle(color: Colors.black, fontSize: 40),
                      onChanged: (String newValue) {
                        setState(() {
                          widget.dropdownValue = newValue;
                          widget.floor = newValue;
                        });
                      },
                      items: List<int>.generate(50, (i) => i + 1)
                          .map<DropdownMenuItem<String>>((int value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                  ])),
              Positioned(
                  left: SizeConfig.screenWidth / 3 + 10,
                  bottom: SizeConfig.screenHeight / 3 + 5,
                  child: InkWell(
                    child: Text(widget.floor,
                        style: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold)),
                    onTap: () {},
                  )),
              Positioned(
                  bottom: 110,
                  right: (SizeConfig.screenWidth / 2.0) - 300 * 0.1,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      width: 300,
                      child: Slider(
                        value: double.parse(widget.floor),
                        min: 1,
                        max: 50,
                        divisions: 50,
                        activeColor: Colors.cyan,
                        inactiveColor: Colors.grey,
                        // label: widget.slideval.toString(),
                        onChanged: (double newValue) {
                          setState(() {
                            widget.slideval = newValue.round();
                            widget.floor = newValue.toInt().toString();
                          });
                        },
                      ),
                    ),
                  )),
              Positioned(
                  left: 10,
                  bottom: 10,
                  child: Row(
                    children: [
                      InkWell(
                        child: Image(
                            image: AssetImage(widget.up_img),
                            width: 120,
                            height: 120),
                        onTap: () {
                          setState(() {
                            widget.up_img = "assets/images/up_2.png";
                          });
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ElevatorSummonDiag();
                              });
                        },
                      ),
                      SizedBox(
                          width:
                              MediaQuery.of(context).size.width - 2 * 120 - 15),
                      InkWell(
                        child: Image(
                            image: AssetImage(widget.down_img),
                            width: 120,
                            height: 120),
                        onTap: () {
                          setState(() {
                            widget.down_img = "assets/images/down_2.png";
                          });
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ElevatorSummonDiag();
                              });
                        },
                      ),
                    ],
                  ))
            ])));
  }
}

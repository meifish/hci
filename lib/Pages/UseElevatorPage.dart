import 'package:flutter/material.dart';
import 'package:hci/sizeConfig.dart';

class UseElevatorPage extends StatefulWidget {
  String floor = "44";
  String up_img = "assets/images/up_1.png";
  String down_img = "assets/images/down_1.png";

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
                  left: SizeConfig.screenWidth / 3 + 10,
                  bottom: SizeConfig.screenHeight / 3 + 5,
                  child: Text(widget.floor,
                      style: TextStyle(
                          fontSize: 100, fontWeight: FontWeight.bold))),
              Positioned(
                  left: 30,
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
                        },
                      ),
                      SizedBox(width: 110),
                      InkWell(
                        child: Image(
                            image: AssetImage(widget.down_img),
                            width: 120,
                            height: 120),
                        onTap: () {
                          setState(() {
                            widget.down_img = "assets/images/down_2.png";
                          });
                        },
                      ),
                    ],
                  ))
            ])));
  }
}

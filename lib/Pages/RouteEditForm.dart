import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hci/sizeConfig.dart';
import 'package:hci/Widgets/MyRouteWidgets/RaisedButton.dart';
import 'package:hci/my_flutter_app_icons.dart';

class RouteEditForm extends StatefulWidget {
  int index;
  List<Map<String, dynamic>> my_routes;
  Map<String, dynamic> route;
  bool isAnytime;
  List<bool> _daySelections = List.generate(7, (_) => false);

  RouteEditForm({this.my_routes, this.index}) {
    route = my_routes[index];
    isAnytime = route["is-anytime"];
    if (route["on-day"].contains("Sun")) {
      _daySelections[0] = true;
    }
    if (route["on-day"].contains("Mon")) {
      _daySelections[1] = true;
    }
    if (route["on-day"].contains("Tue")) {
      _daySelections[2] = true;
    }
    if (route["on-day"].contains("Wed")) {
      _daySelections[3] = true;
    }
    if (route["on-day"].contains("Thur")) {
      _daySelections[4] = true;
    }
    if (route["on-day"].contains("Fri")) {
      _daySelections[5] = true;
    }
    if (route["on-day"].contains("Sat")) {
      _daySelections[6] = true;
    }
  }

  @override
  _RouteEditFormState createState() => _RouteEditFormState();
}

class _RouteEditFormState extends State<RouteEditForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    new SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Form(
            key: _formKey,
            child: ListView(padding: EdgeInsets.all(15), children: [
              Row(children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(widget.route["img"]),
                            fit: BoxFit.cover)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RaisedCyanButton(
                        child: Text(
                          "Change Image",
                        ),
                        onPressed: () {}),
                    Text("This function is under development.",
                        style: TextStyle(color: Colors.grey, fontSize: 12))
                  ],
                ),
              ]),

              ////////////////////////////////////////////////////////////////
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Name
                      Container(
                        height: 60,
                        // width: 200,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelStyle:
                                TextStyle(color: Colors.cyan, fontSize: 18),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                            hintText: 'Name your route',
                            labelText: 'Route Name',
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20)
                          ],
                          initialValue: widget.route["name"],
                          validator: (name) {
                            if (name.isEmpty) {
                              return 'Route name is required';
                            }
                            if (name.length < 1) {
                              return 'Route name is too short';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          autofocus: true,
                          onSaved: (name) {
                            widget.route["name"] = name;
                          },
                        ),
                      ),
                      SizedBox(height: 30),

                      ////////////////////////////////////////////////////////////////
                      /// From - to Floor

                      Container(
                        // color: Colors.grey,
                        alignment: Alignment.center,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Take me between",
                                  style: TextStyle(
                                      color: Colors.cyan, fontSize: 16)),
                              SizedBox(height: 10),
                              Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 80,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(
                                                    const Radius.circular(
                                                        70.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.grey)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(
                                                    const Radius.circular(
                                                        70.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.cyan)),
                                            hintText:
                                                'The order does not matter',
                                            labelText: 'Floor 1',
                                            labelStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.cyan),
                                            hintStyle: TextStyle(fontSize: 12)),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(1)
                                        ],
                                        initialValue:
                                            widget.route["floor-1"].toString(),
                                        validator: (floor1) {
                                          if (!floor1.isEmpty) {
                                            if ((int.parse(floor1) > 48) ||
                                                (int.parse(floor1) < 1))
                                              return 'A valid floor is required';
                                          }
                                          return null;
                                        },
                                        textInputAction: TextInputAction.next,
                                        autofocus: true,
                                        onSaved: (floor1) {
                                          widget.route["floor-1"] = floor1;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: Icon(
                                        MyFlutterApp.arrows_alt_h,
                                        color: Colors.cyan,
                                        size: 15,
                                      ),
                                    ),
                                    // to floor
                                    Container(
                                      height: 40,
                                      width: 80,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(
                                                    const Radius.circular(
                                                        70.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.grey)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(
                                                    const Radius.circular(
                                                        70.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.cyan)),
                                            hintText:
                                                'The order does not matter',
                                            labelText: 'Floor 2',
                                            labelStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.cyan),
                                            hintStyle: TextStyle(fontSize: 12)),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(1)
                                        ],
                                        initialValue:
                                            widget.route["floor-2"].toString(),
                                        validator: (floor2) {
                                          if (!floor2.isEmpty) {
                                            if ((int.parse(floor2) > 48) ||
                                                (int.parse(floor2) < 1) ||
                                                (int.parse(floor2) ==
                                                    widget.route["floor-2"]))
                                              return 'A valid floor is required. Two floors cannot have same value';
                                          }
                                          return null;
                                        },
                                        textInputAction: TextInputAction.next,
                                        autofocus: true,
                                        onSaved: (floor1) {
                                          widget.route["floor-1"] = floor1;
                                        },
                                      ),
                                    ),
                                  ]),
                              Row(children: [
                                Text("Anytime",
                                    style: TextStyle(
                                        color: Colors.cyan, fontSize: 16)),
                                SizedBox(width: 20),
                                Container(
                                  width: 60,
                                  height: 80,
                                  child: Transform.scale(
                                    scale: 1.25,
                                    child: Switch(
                                      value: widget.route["is-anytime"],
                                      onChanged: (value) {
                                        setState(() {
                                          widget.route["is-anytime"] = value;
                                          print(value);
                                        });
                                      },
                                      activeTrackColor: Colors.cyanAccent,
                                      activeColor: Colors.cyan,
                                    ),
                                  ),
                                ),
                              ]),
                              Container(
                                  child: widget.route["is-anytime"]
                                      ? Text("")
                                      : Column(children: [
                                          Row(children: [
                                            Container(
                                              height: 40,
                                              width: 80,
                                              child: TextFormField(
                                                decoration: const InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: const BorderRadius.all(
                                                            const Radius.circular(
                                                                70.0)),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                            const BorderRadius.all(
                                                                const Radius.circular(
                                                                    70.0)),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.cyan)),
                                                    hintText: 'from time',
                                                    labelText: 'From time',
                                                    labelStyle:
                                                        TextStyle(fontSize: 12, color: Colors.cyan),
                                                    hintStyle: TextStyle(fontSize: 12)),
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      1)
                                                ],
                                                initialValue: widget
                                                        .route["time-from"]
                                                        .isEmpty
                                                    ? "00:00"
                                                    : widget.route["time-from"],
                                                validator: (time) {
                                                  if (!time.isEmpty) {
                                                    if (!time.contains(":")) {
                                                      return 'A valid time is required.';
                                                    } else if ((int.parse(
                                                                time.split(
                                                                    ":")[0]) >
                                                            23) ||
                                                        (int.parse(time.split(
                                                                ":")[0]) <
                                                            0)) {
                                                      return 'A valid time is required.';
                                                    } else if ((int.parse(
                                                                time.split(
                                                                    ":")[0]) >
                                                            59) ||
                                                        (int.parse(time.split(
                                                                ":")[0]) <
                                                            0))
                                                      return 'A valid time is required.';
                                                  }
                                                  return null;
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                                autofocus: true,
                                                onSaved: (time_from) {
                                                  widget.route["time-from"] =
                                                      time_from;
                                                },
                                              ),
                                            ),
                                            SizedBox(width: 30),
                                            Container(
                                              height: 45,
                                              width: 80,
                                              child: TextFormField(
                                                decoration: const InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: const BorderRadius.all(
                                                            const Radius.circular(
                                                                70.0)),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                            const BorderRadius.all(
                                                                const Radius.circular(
                                                                    70.0)),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.cyan)),
                                                    hintText: 'to time',
                                                    labelText: 'To time',
                                                    labelStyle:
                                                        TextStyle(fontSize: 12, color: Colors.cyan),
                                                    hintStyle: TextStyle(fontSize: 12)),
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      1)
                                                ],
                                                initialValue: widget
                                                        .route["time-to"]
                                                        .isEmpty
                                                    ? "23:59"
                                                    : widget.route["time-to"],
                                                validator: (time) {
                                                  if (!time.isEmpty) {
                                                    if (!time.contains(":")) {
                                                      return 'A valid time is required.';
                                                    } else if ((int.parse(
                                                                time.split(
                                                                    ":")[0]) >
                                                            23) ||
                                                        (int.parse(time.split(
                                                                ":")[0]) <
                                                            0)) {
                                                      return 'A valid time is required.';
                                                    } else if ((int.parse(
                                                                time.split(
                                                                    ":")[0]) >
                                                            59) ||
                                                        (int.parse(time.split(
                                                                ":")[0]) <
                                                            0))
                                                      return 'A valid time is required.';
                                                  }
                                                  return null;
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                                autofocus: true,
                                                onSaved: (time_from) {
                                                  widget.route["time-from"] =
                                                      time_from;
                                                },
                                              ),
                                            ),
                                          ]),
                                          SizedBox(height: 15),
                                          ToggleButtons(
                                            color: Colors.cyan,
                                            selectedColor: Colors.white,
                                            fillColor: Colors.cyan,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: Text("Sun")),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: Text("Mon")),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: Text("Tue")),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: Text("Wed")),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: Text("Thu")),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: Text("Fri")),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: Text("Sat")),
                                            ],
                                            isSelected: widget._daySelections,
                                            onPressed: (int index) {
                                              widget._daySelections[index] =
                                                  !widget._daySelections[index];

                                              setState(() {});
                                            },
                                          ),
                                          Text(
                                              "Blue is selected. Toggle the button to select the day.",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12)),
                                          SizedBox(height: 20),
                                        ])),
                            ]),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: RaisedButton(
                                child: Text("Discard"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                textColor: Colors.white,
                                color: Colors.grey,
                                splashColor: Colors.cyanAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          SizedBox(width: 15),
                          SizedBox(
                            width: 150,
                            child: RaisedButton(
                                child: Text("Save"),
                                onPressed: () {},
                                textColor: Colors.white,
                                color: Colors.cyan[600],
                                splashColor: Colors.cyanAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                        ],
                      )
                    ]),
              ),
            ])),
      ),
    );
  }
}

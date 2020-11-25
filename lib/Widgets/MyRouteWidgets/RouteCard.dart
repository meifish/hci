import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hci/sizeConfig.dart';
import 'package:hci/my_flutter_app_icons.dart';
import 'package:hci/Widgets/MyRouteWidgets/PopupMenuButton.dart';
import 'package:hci/Pages/RouteEditForm.dart';

class RouteCard extends StatefulWidget {
  String name;
  String img;
  String floor1;
  String floor2;
  String time_from;
  String time_to;

  List<Map<String, dynamic>> my_routes;
  int index;
  Map<String, dynamic> route;

  RouteCard({this.my_routes, this.index}) {
    route = my_routes[index];
    name = route["name"];
    img = route["img"];
    floor1 = route["floor1"].toString();
    floor2 = route["floor2"].toString();
    time_from = route["timeFrom"];
    time_to = route["timeTo"];
  }

  @override
  _RouteCardState createState() => _RouteCardState();
}

class _RouteCardState extends State<RouteCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: SizedBox(
        height: 200,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.cyan[600],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 4.5,
                                    color: Colors.white),
                              ),
                            ),
                            PopupMenu(
                                my_routes: widget.my_routes,
                                index: widget.index),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.meeting_room,
                              size: SizeConfig.safeBlockHorizontal * 5,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.floor1,
                              style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 4.7,
                                  color: Colors.white),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              MyFlutterApp.arrows_alt_h,
                              color: Colors.white70,
                              size: 15,
                            ),
                            SizedBox(width: 5),
                            Text(
                              widget.floor2,
                              style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 4.7,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: SizeConfig.safeBlockHorizontal * 90,
                          //color: Colors.pink,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Container(
                                  width: SizeConfig.safeBlockHorizontal * 15,
                                  height: SizeConfig.safeBlockVertical * 8,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(widget.img)),
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 9,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      widget.time_from,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  4.7,
                                          color: Colors.black87),
                                    ),
                                    Text(
                                      widget.time_to,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  4.7,
                                          color: Colors.black87),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    //color: Colors.red,
                                    child: Icon(Icons.info,
                                        size:
                                            SizeConfig.safeBlockHorizontal * 9,
                                        // color: Colors.blue,
                                        color: Colors.cyan[600]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            width: SizeConfig.safeBlockHorizontal * 90,
                            //color: Colors.indigo,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    height: SizeConfig.safeBlockVertical * 6,
                                    child: RaisedButton(
                                      disabledElevation: 0,
                                      focusElevation: 0,
                                      highlightElevation: 0,
                                      hoverElevation: 0,
                                      elevation: 0.5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      textColor: Colors.white,
                                      // color: Colors.blue,
                                      color: Colors.cyan[600],
                                      child: Text(
                                        'Activate',
                                        style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  5.5,
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    height: SizeConfig.safeBlockVertical * 6,
                                    child: RaisedButton(
                                      disabledElevation: 0,
                                      focusElevation: 0,
                                      highlightElevation: 0,
                                      hoverElevation: 0,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      textColor: Colors.black26,
                                      color: Color(0xffEBEFFB),
                                      child: Text(
                                        'Set Default',
                                        style: TextStyle(
                                          color: Color(0xff878FA6),
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  5,
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

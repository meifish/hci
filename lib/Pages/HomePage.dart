import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:hci/Widgets/HomePageWidgets/MenuOption.dart';
import 'package:hci/Model/RouteDBModel.dart';
import 'package:hci/Model/Route.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _model = RouteModel();

  @override
  void initState() {
    super.initState();
    _initMyRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/elevator1.jpg"),
                fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuOption(
                    option: 'My Routes',
                    route: '/MyRoute',
                    icon: Icons.favorite),
                MenuOption(
                    option: 'Use An Elevator',
                    route: '/MyRoute',
                    icon: Icons.elevator),
                MenuOption(
                    option: 'Share Access',
                    route: '/MyRoute',
                    icon: Icons.share),
                MenuOption(
                  option: 'Setting',
                  route: '/Settings',
                  icon: Icons.settings,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _loadJSONRoutes() async {
    final saved_routes = await DefaultAssetBundle.of(context)
        .loadString('assets/data/myRoutes.json');

    final List<Map<String, dynamic>> routes =
        await jsonDecode(saved_routes).cast<Map<String, dynamic>>();

    setState(() {});
    return routes;
  }

  void _initMyRoute() async {
    // Load the MyRoute data from JSON and insert to DB at program start

    List<Map<String, dynamic>> my_routes = await _loadJSONRoutes();

    for (int i = 0; i < my_routes.length; i++) {
      MyRoute r = MyRoute.fromMap(my_routes[i]);
      int returnId = await _model.insertRoute(r);
      print('Sql inserted: $returnId');
    }
    print('Done db import');
    setState(() {});
  }
}

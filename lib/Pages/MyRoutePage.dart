import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:hci/Widgets/MyRouteWidgets/RouteCard.dart';
import 'package:hci/Model/RouteDBModel.dart';
import 'package:hci/Model/Route.dart';
import 'package:hci/sizeConfig.dart';

class MyRoutePage extends StatefulWidget {
  @override
  _MyRoutePageState createState() => _MyRoutePageState();
}

class _MyRoutePageState extends State<MyRoutePage> {
  final _model = RouteModel();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text('My Routes'),
        ),
        body: FutureBuilder(
            future: _loadAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Map<String, dynamic>> routes = snapshot.data;

                return ListView.builder(
                    itemCount: routes.length,
                    itemBuilder: (context, index) {
                      return RouteCard(my_routes: routes, index: index);
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  Future<List<Map<String, dynamic>>> _loadAll() async {
    List<MyRoute> all_routes = await _model.getAllRoutes();
    print("pulling from DB");
    print(all_routes);

    List<Map<String, dynamic>> routes_map = [];

    for (int i = 0; i < all_routes.length; i++) {
      routes_map.add(all_routes[i].toMap());
    }
    return routes_map;
  }
}

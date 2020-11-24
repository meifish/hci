import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:hci/Widgets/MyRouteWidgets/RouteCard.dart';
import 'package:hci/sizeConfig.dart';

class MyRoute extends StatefulWidget {
  List<Map<String, dynamic>> routes;

  @override
  _MyRouteState createState() => _MyRouteState();
}

class _MyRouteState extends State<MyRoute> {
  void initState() {
    super.initState();
    _loadJSONRoutes();
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
            future: _loadJSONRoutes(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Map<String, dynamic>> routes = snapshot.data;
                return ListView.builder(
                    itemCount: routes.length,
                    itemBuilder: (context, index) {
                      return RouteCard(route: routes[index]);
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  Future<List<Map<String, dynamic>>> _loadJSONRoutes() async {
    final saved_routes = await DefaultAssetBundle.of(context)
        .loadString('assets/data/myRoutes.json');

    final List<Map<String, dynamic>> routes =
        jsonDecode(saved_routes).cast<Map<String, dynamic>>();

    widget.routes = routes;
    setState(() {});
    return routes;
  }
}

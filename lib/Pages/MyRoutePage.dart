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
    _loadJSONRoutes();
    _loadAll();
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
                // List<Map<String, dynamic>> routes = widget.routes;

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

  Future<List<Map<String, dynamic>>> _loadJSONRoutes() async {
    // Future<int> _loadJSONRoutes() async {
    final saved_routes = await DefaultAssetBundle.of(context)
        .loadString('assets/data/myRoutes.json');

    final List<Map<String, dynamic>> routes =
        await jsonDecode(saved_routes).cast<Map<String, dynamic>>();

    setState(() {});
    return routes;
    // return 1;
  }

  Future<List<MyRoute>> _loadAll() async {
    List<MyRoute> all_routes = await _model.getAllRoutes();

    print("loading");
    for (MyRoute r in all_routes) {
      print(r);
    }
    return all_routes;
  }
}

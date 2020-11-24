import 'package:flutter/material.dart';
import 'Pages/MyRoute.dart';
import 'Pages/HomePage.dart';
import 'Pages/Settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SSE',
        theme: ThemeData(
          // Define the default brightness and colors.
          // brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Home Page'),
        routes: {
          '/MyRoute': (context) => MyRoute(),
          '/Settings': (context) => Settings(title: "Setting"),
        });
  }
}

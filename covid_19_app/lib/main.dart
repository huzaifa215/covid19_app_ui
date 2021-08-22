import 'package:covid_19_app/models/data_source.dart';
import 'package:covid_19_app/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return DynamicTheme(
    //   data: (brightness) => new ThemeData(
    //       primaryColor: primaryBlack,
    //       brightness: brightness == Brightness.dark
    //           ? Brightness.light
    //           : Brightness.dark,
    //       scaffoldBackgroundColor: brightness == Brightness.dark
    //           ? Colors.blueGrey[900]
    //           : Colors.white),
    //   themedWidgetBuilder: (context, theme) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 App',
      theme: ThemeData(
        primaryColor: primaryBlack,
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: HomePage(),
    );
    //   },
    // );
  }
}

import 'package:covid_19_app/utils/data_source.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryBlack,
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: HomePage(),
    );
  }
}

// api call here
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID-19 TRACKER"),
        centerTitle: true,
        elevation: 9,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(20)),
                color: Colors.orange.shade100,
              ),
              child: Text(
                DataSource.quote,
                style: TextStyle(fontSize: 15, color: Colors.orange.shade800),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

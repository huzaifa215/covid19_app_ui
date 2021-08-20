import 'dart:convert';

import 'package:covid_19_app/models/data_source.dart';
import 'package:covid_19_app/widgets/info_pannel.dart';
import 'package:covid_19_app/widgets/most_affected_countries.dart';
import 'package:covid_19_app/widgets/world_wide_pannel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // fetch data form api
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
  Map worldData;
  List countryData;

  fetchWorldWideData() async {
    http.Response response =
        await http.get(Uri.parse("https://corona.lmao.ninja/v3/covid-19/all"));
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  fetchCountryData() async {
    http.Response response = await http
        .get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    // TODO: implement initState
    super.initState();
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            // TODO: World Wide Panel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "World Wide",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                // SizedBox(width: 0,),
                Container(
                    margin: EdgeInsets.only(right: 7),
                    child: RaisedButton(
                      color: Colors.grey.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      child: Text(
                        "Regional",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
            if (worldData == null)
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CircularProgressIndicator())
            else
              WorldWidePanel(
                worldData: worldData,
              ),
            // TODO: Most Affected Countries
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                "Most Affected Countries",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            if (countryData == null)
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CircularProgressIndicator())
            else
              MostAffectedPanel(
                countryData: countryData,
              ),
            // GFAccordion(
            //     title: 'GF Accordion',
            //     content: 'GetWidget is an open source library that comes with pre-build 1000+ UI components.',
            //     expandedTitleBackgroundColor: Colors.grey.shade200,
            //     collapsedTitleBackgroundColor:Colors.grey.shade500,
            //     collapsedIcon: Icon(Icons.add),
            //     expandedIcon: Icon(Icons.minimize)
            // ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                "COVID-19 Information",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            InformationPanel(),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              "WE ARE TOGETHER IN THE FIGHT",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.orange.shade600,
              ),
            )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:covid_19_app/models/data_source.dart';
import 'package:covid_19_app/widgets/info_pannel.dart';
import 'package:covid_19_app/widgets/most_affected_countries.dart';
import 'package:covid_19_app/widgets/pie_chart_widget.dart';
import 'package:covid_19_app/widgets/world_wide_pannel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';
import 'country_page.dart';

// api call here
// fetch data form api
// This widget is the root of your application.
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  List countryData;
  Map data;

  fetchWorldWideData() async {
    http.Response response =
        await http.get(Uri.parse("https://corona.lmao.ninja/v3/covid-19/all"));
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  fetchCountryData() async {
    http.Response response = await http.get(Uri.parse(
        'https://corona.lmao.ninja/v3/covid-19/countries?sort=cases')); // sort the data on the basis of cases
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryData();
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(icon: Icon(Theme.of(context).brightness == Brightness.light? Icons.brightness_2_outlined : Icons.brightness_2_rounded), onPressed:(){})
        // ],
        title: Text("COVID-19 TRACKER"),
        centerTitle: true,
        elevation: 9,
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        backgroundColor: Colors.white,
        color: Colors.grey,
        displacement: 50,
        strokeWidth: 2,
        child: SingleChildScrollView(
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
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // SizedBox(width: 0,),
                  Container(
                      margin: EdgeInsets.only(right: 7),
                      child: RaisedButton(
                        color: Colors.grey.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CountryPage()));
                        },
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
              // TODO: PieChart
              SizedBox(
                height: 10,
              ),
              // Pie Chart
              if (worldData == null)
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CircularProgressIndicator())
              else
                PieChartWidget(
                  worldData: worldData,
                ),
              SizedBox(
                height: 10,
              ),
              // TODO: Most Affected Countries
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
                height: 6,
              ),
              Center(
                  child: Text(
                "WE ARE TOGETHER IN THE FIGHT",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

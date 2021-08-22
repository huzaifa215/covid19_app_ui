import 'dart:convert';

import 'package:covid_19_app/models/data_source.dart';
import 'package:covid_19_app/models/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;

  fetchCountryData() async {
    http.Response response = await http
        .get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){
            
            showSearch(context: context, delegate: Search(countryData));
          })
        ],
        centerTitle: true,
        backgroundColor: primaryBlack,
        title: Text("Country Data"),
      ),
      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Card(
            child: Container(
                child: ListView.builder(
                  itemCount: countryData == null ? 0 : countryData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 120,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              color: Colors.grey[200],
                              blurRadius: 10,
                              offset: Offset(0, 10),
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 26),
                            child: Text(
                              countryData[index]["country"],
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.network(
                                countryData[index]["countryInfo"]["flag"],
                                height: 90,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "CONFIRMED:${countryData[index]["cases"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red.shade700),
                                  ),
                                  Text(
                                    "ACTIVE:${countryData[index]["active"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade700),
                                  ),
                                  Text(
                                    "RECOVERED:${countryData[index]["recovered"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green.shade700),
                                  ),
                                  Text(
                                    "DEATHS:${countryData[index]["deaths"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      //    ),
                    );
                  },
                ),
              ),
          ),
    );
  }
}

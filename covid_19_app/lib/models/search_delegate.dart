import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryData;

  Search(this.countryData);

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      child: Center(child: Image.asset("images/R.png")),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? countryData
        : countryData.where((element) =>
            element["country"].toString().toLowerCase().startsWith(query)).toList();
    return ListView.builder(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: suggestionList.isEmpty?0:suggestionList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
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
                      suggestionList[index]["country"],
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
                        suggestionList[index]["countryInfo"]["flag"],
                        height: 90,
                      ),
                      Column(
                        children: [
                          Text(
                            "CONFIRMED:${suggestionList[index]["cases"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red.shade700),
                          ),
                          Text(
                            "ACTIVE:${suggestionList[index]["active"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade700),
                          ),
                          Text(
                            "RECOVERED:${suggestionList[index]["recovered"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade700),
                          ),
                          Text(
                            "DEATHS:${suggestionList[index]["deaths"]}",
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
            ),
          );
        });
  }
}

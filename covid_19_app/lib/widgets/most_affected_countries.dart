import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        // decoration: BoxDecoration(
        //     color: Colors.grey.shade200,
        //   borderRadius: BorderRadius.circular(20),
        // ),
        child: ListView.builder(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
                child: Row(
                  children: [
                    Image.network(countryData[index]["countryInfo"]["flag"],height: 27,),
                    SizedBox(width: 20,),
                    Text(
                      countryData[index]['country'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "Deaths: ${countryData[index]["deaths"]}",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
        ),
      ),
    );
  }
}

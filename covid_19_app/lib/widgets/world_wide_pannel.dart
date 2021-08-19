import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          StatusPanel(
            panelcolor: Colors.orange.shade200,
            textcolor: Colors.orange.shade800,
            title: "CONFIRMED",
            count: "1715580",
          ),
          StatusPanel(
            panelcolor: Colors.blue.shade200,
            textcolor: Colors.blue.shade800,
            title: "ACTIVE",
            count: "1255580",
          ),
          StatusPanel(
            panelcolor: Colors.green.shade200,
            textcolor: Colors.green.shade800,
            title: "RECOVERED",
            count: "175480",
          ),
          StatusPanel(
            panelcolor: Colors.grey.shade300,
            textcolor: Colors.grey.shade800,
            title: "DEATH",
            count: "155580",
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  StatusPanel({
    this.panelcolor,
    this.title,
    this.count,
    this.textcolor
  });

  final Color panelcolor;
  final Color textcolor;
  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(5),
      height: 100,
      width: width / 2,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(10),
        color: panelcolor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: textcolor),
          ),
          Text(
            count,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: textcolor),
          ),
        ],
      ),
    );
  }
}

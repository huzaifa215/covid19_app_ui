import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
class PieChartWidget extends StatelessWidget {
  final Map worldData;

  const PieChartWidget({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:PieChart(
        dataMap: {
          "Confirmed": worldData["cases"].toDouble(),
          "Active": worldData["cases"].toDouble(),
          "Recovered": worldData["recovered"].toDouble(),
          "Deaths": worldData["deaths"].toDouble(),
        },
        // animationDuration: Duration(milliseconds: 8000),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3.2,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        legendOptions: LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.left,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: false,
          //  decimalPlaces: 0,
        ),
      ),
    );
  }
}

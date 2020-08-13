import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineChartExample extends StatefulWidget {
  @override
  _LineChartExampleState createState() => _LineChartExampleState();
}

class _LineChartExampleState extends State<LineChartExample> {
  List<charts.Series<LineChartData, int>> seriesList;

  _getLineData() {
    var data = [
      LineChartData(59, 2),
      LineChartData(74, 3),
      LineChartData(80, 4),
      LineChartData(99, 5),
      LineChartData(82, 6),
      LineChartData(88, 7),
    ];

    seriesList.add(charts.Series(
      data: data,
      id: 'Sales',
      domainFn: (LineChartData line, _) => line.month,
      measureFn: (LineChartData line, _) => line.sales,
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesList = List<charts.Series<LineChartData, int>>();
    _getLineData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: charts.LineChart(
        seriesList,
        animate: true,
        defaultRenderer:
            charts.LineRendererConfig(includeArea: true, includePoints: true),
      ),
    );
  }
}

class LineChartData {
  int sales;
  int month;

  LineChartData(this.sales, this.month);
}

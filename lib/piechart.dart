import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PieChartExample extends StatefulWidget {
  @override
  _PieChartExampleState createState() => _PieChartExampleState();
}

class _PieChartExampleState extends State<PieChartExample> {
  List<charts.Series<ChartData, dynamic>> seriesData;

  _getData() {
    var data = [
      ChartData('one', 23.99),
      ChartData('two', 43.99),
      ChartData('three', 19.99),
      ChartData('four', 45.99),
      ChartData('five', 59.99),
      ChartData('six', 72.99),
    ];

    seriesData.add(charts.Series(
        id: 'My Chart',
        data: data,
        domainFn: (ChartData item, _) => item.item,
        measureFn: (ChartData item, _) => item.cost));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesData = List<charts.Series<ChartData, dynamic>>();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: charts.PieChart(
        seriesData,
        animate: true,
        defaultRenderer: charts.ArcRendererConfig(arcWidth: 60),
      ),
    );
  }
}

class ChartData {
  String item;
  double cost;

  ChartData(this.item, this.cost);
}

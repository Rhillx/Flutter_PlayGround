import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChartExample extends StatefulWidget {
  @override
  _BarChartExampleState createState() => _BarChartExampleState();
}

class _BarChartExampleState extends State<BarChartExample> {
  List<charts.Series<BarChartData, String>> _seriesData;

  _getBarData() {
    var data = [
      BarChartData('Snickers', 230),
      BarChartData('GG4', 156),
      BarChartData('Purple Punch', 209),
      BarChartData('Runtz', 85),
    ];

    _seriesData.add(charts.Series(
      data: data,
      id: 'Sales',
      domainFn: (BarChartData item, _) => item.item,
      measureFn: (BarChartData item, _) => item.sales,
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<BarChartData, String>>();
    _getBarData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: charts.BarChart(
        _seriesData,
        animate: true,
        barRendererDecorator: charts.BarLabelDecorator(
            labelPosition: charts.BarLabelPosition.inside,
            insideLabelStyleSpec: charts.TextStyleSpec(
                fontFamily: 'Georgia',
                fontSize: 16,
                color: charts.Color.black)),
        domainAxis: charts.OrdinalAxisSpec(),
      ),
    );
  }
}

class BarChartData {
  String item;
  int sales;

  BarChartData(this.item, this.sales);
}

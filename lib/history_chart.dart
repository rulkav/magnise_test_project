import 'package:charts_flutter/flutter.dart' as chart;
import 'package:flutter/material.dart';

import 'models/history_cripto_model.dart';

class HistoryChart extends StatelessWidget {
  final List<HistoryCryptoModel> data;
  const HistoryChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<chart.Series<HistoryCryptoModel, num>> series = [
      chart.Series(
        id: "currency_rate",
        data: data,
        domainFn: (HistoryCryptoModel series, _) =>
            int.parse(series.timeOpen!.substring(8, 10)),
        measureFn: (HistoryCryptoModel series, _) => series.rateOpen,
        // colorFn: (HistoryCryptoModel series, _) => Colors.blue//series.barColor
      )
    ];
    int first = int.parse(data.first.timeOpen!.substring(8, 10));
    int last = int.parse(data.last.timeOpen!.substring(8, 10));
    return Container(
      height: 300,
      // padding: EdgeInsets.all(25),
      child: Card(
        child: chart.LineChart(series,
            domainAxis: chart.NumericAxisSpec(
              tickProviderSpec:
                  const chart.BasicNumericTickProviderSpec(zeroBound: false),
              viewport: chart.NumericExtents(first, last),
            ),
            animate: false),
      ),
    );
  }
}

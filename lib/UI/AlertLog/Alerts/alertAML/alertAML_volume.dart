import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AlertAmlVolumeChart extends StatefulWidget {
  const AlertAmlVolumeChart({super.key});

  @override
  State<AlertAmlVolumeChart> createState() => _AlertAmlVolumeChartState();
}

class _AlertAmlVolumeChartState extends State<AlertAmlVolumeChart> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true, duration: 500);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Low Risk', 12, 10, 14, 20),
      ChartData('High Risk', 14, 11, 18, 23),
      ChartData('Medium Risk', 16, 10, 15, 20),
    ];

    return Container(
        height: 380.h,
        width: 600.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.black),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(3.0, 3.0),
              ),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0)
            ]),
        child: Column(
          children: [
            Container(
              height: 40.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r))),
              child: Center(
                child: Text(
                  "Alert Volume By Customer Type",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SfCartesianChart(
                tooltipBehavior: _tooltip,
                legend: Legend(isVisible: true, position: LegendPosition.right),
                primaryXAxis: CategoryAxis(
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                primaryYAxis: NumericAxis(
                  isVisible: false,
                ),
                series: <CartesianSeries>[
                  StackedColumnSeries<ChartData, String>(
                      name: "Fraudulent Transaction",
                      color: Colors.teal,
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y1),
                  StackedColumnSeries<ChartData, String>(
                      name: "Fictitious Accounts",
                      color: Colors.tealAccent,
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y2),
                  StackedColumnSeries<ChartData, String>(
                      name: "Unauthorized Credit, Cash Shortages",
                      color: Colors.teal.shade900,
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y3),
                  StackedColumnSeries<ChartData, String>(
                      name: "Foreign Exchange Issues",
                      dataSource: chartData,
                      color: Colors.teal.shade700,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y4)
                ]),
          ],
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
  final String x;
  final double y1;
  final double y2;
  final double y3;
  final double y4;
}

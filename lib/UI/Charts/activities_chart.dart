import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivitiesChart extends StatefulWidget {
  const ActivitiesChart({super.key});

  @override
  State<ActivitiesChart> createState() => _ActivitiesChartState();
}

class _ActivitiesChartState extends State<ActivitiesChart> {
   late TooltipBehavior _tooltip;

   @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true,duration: 500);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Jan', 12, 10, 14, 20),
      ChartData('Feb', 14, 11, 18, 23),
      ChartData('Mar', 16, 10, 15, 20),
      ChartData('Apr', 18, 16, 18, 24)
    ];

    return Container(
       height: 300.h,
          width: 480.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow:const [
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
                spreadRadius: 0.0
              )
            ]
          ),
        child: SfCartesianChart(
          title: ChartTitle(text: "Activities",textStyle: TextStyle(fontWeight: FontWeight.bold)),
          tooltipBehavior: _tooltip,
            primaryXAxis: CategoryAxis(),
            legend: Legend(
              isVisible: true,
              position: LegendPosition.top
            ),
            series: <CartesianSeries>[
          StackedColumnSeries<ChartData, String>(
              name: "CTR",
              dataSource: chartData,
              spacing: .3,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y1,
              groupName: "CTR",
              color: Colors.black,
              borderRadius: BorderRadius.only( topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),
              ),
              
          StackedColumnSeries<ChartData, String>(
            name: "STR",
              dataSource: chartData,
              spacing: 0.3,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y2,
               groupName: "STR",
               color: Colors.grey,
                borderRadius: BorderRadius.only( topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),),
          StackedColumnSeries<ChartData, String>(
            name: "CBWT",
              dataSource: chartData,
              spacing: 0.3,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y3,
               groupName: "CBWT",
               color: Colors.tealAccent,
                borderRadius: BorderRadius.only( topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),),
          StackedColumnSeries<ChartData, String>(
            name: "NTR",
              dataSource: chartData,
              spacing: 0.3,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y4,
               groupName: "NTR",
               color: Colors.teal,
                borderRadius: BorderRadius.only( topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),)
        ]));
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

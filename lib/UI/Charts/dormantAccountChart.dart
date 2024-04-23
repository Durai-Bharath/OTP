import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DormantAccountChart extends StatefulWidget {
  const DormantAccountChart({super.key});

  @override
  State<DormantAccountChart> createState() => _DormantAccountChartState();
}

class _DormantAccountChartState extends State<DormantAccountChart> {
 
  late TooltipBehavior _tooltip;

    @override
    void initState() {
      _tooltip = TooltipBehavior(enable: true,duration: 500);
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
   

    final List<ChartData> chartData = [
      ChartData('Jan', 12, 17),
      ChartData('Feb', 14, 20),
      ChartData('Mar', 16, 25),
      ChartData('Apr', 18, 26)
    ];

    return Container(
        height: 300.h,
        width: 280.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
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
        child: SfCartesianChart(
          tooltipBehavior: _tooltip,
            title: ChartTitle(
                text: "Dormant Account",
                textStyle: TextStyle(fontWeight: FontWeight.bold)),
            legend: Legend(
              isVisible: true,
              position: LegendPosition.top,
            ),
            primaryXAxis: CategoryAxis(),
            series: <CartesianSeries>[
              StackedColumnSeries<ChartData, String>(
                name: "2yr +",
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y1,
                color: Colors.teal,
              ),
              StackedColumnSeries<ChartData, String>(
                name: "5yr +",
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y2,
                color: Colors.tealAccent,
              ),
            ]));
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2);
  final String x;
  final double y1;
  final double y2;
}

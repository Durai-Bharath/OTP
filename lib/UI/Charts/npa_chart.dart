import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class NpaChart extends StatefulWidget {
  const NpaChart({super.key});

  @override
  State<NpaChart> createState() => _NpaChartState();
}

class _NpaChartState extends State<NpaChart> {
  late TooltipBehavior _tooltip;
   String selectedMonthRange = 'last 6 Month';

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true, duration: 500);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

     List<String> monthRanges = [
      'last 1 Month',
      'last 2 Month',
      'last 3 Month',
      'last 4 Month',
      'last 5 Month',
      'last 6 Month'
    ];
    final List<ChartData> chartData = [
      ChartData('Jan', 12, 17),
      ChartData('Feb', 14, 20),
      ChartData('Mar', 16, 25),
      ChartData('Apr', 18, 26),
      ChartData('May', 18, 26),
      ChartData('Jun', 18, 26)
    ];

    return Container(
        height: 400.h,
        width: 500.w,
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
        child: Column(
          children: [
             Padding(
            padding: EdgeInsets.only(left: 300.w),
            child: DropdownButton<String>(
              // isExpanded: true,

              value: selectedMonthRange,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  debugPrint("Triggered onChanged with value: $newValue");
                  setState(() {
                    selectedMonthRange = newValue;
                  });
                }
              },
              items: monthRanges.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
            SfCartesianChart(
              
                tooltipBehavior: _tooltip,
                title: ChartTitle(
                    text: "NPA",
                    textStyle: TextStyle(fontWeight: FontWeight.bold)),
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.top,
                ),
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(
                  labelFormat: '{value}%',
                ),
                series: <CartesianSeries>[
                  StackedColumnSeries<ChartData, String>(
                    name: "Sub Standard",
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y1,
                    color: Colors.teal,
                  ),
                  StackedColumnSeries<ChartData, String>(
                    name: "Doubtfull",
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y2,
                    color: Colors.tealAccent,
                  ),
                ]),
          ],
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2);
  final String x;
  final double y1;
  final double y2;
}

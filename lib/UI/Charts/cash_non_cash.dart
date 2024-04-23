import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CashNonCashChart extends StatefulWidget {
  const CashNonCashChart({super.key});

  @override
  State<CashNonCashChart> createState() => CashNonCashChartState();
}

class CashNonCashChartState extends State<CashNonCashChart> {
  late List<_ChartData> data;
    late List<_ChartData> data2;

  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Feb', 12),
      _ChartData('Mar', 15),
      _ChartData('Apr', 30),
      _ChartData('Jun', 6.4),
      _ChartData('Aug', 14)
    ];
        data2 = [
      _ChartData('Feb', 32),
      _ChartData('Mar', 35),
      _ChartData('Apr', 30),
      _ChartData('Jun', 2.4),
      _ChartData('Aug', 24)
    ];
    _tooltip = TooltipBehavior(enable: true,duration: 500);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
         Container(
          height: 300.h,
          width: 280.w,
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
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
              tooltipBehavior: _tooltip,
              title: ChartTitle(text: "Suspicious Transactions",textStyle: TextStyle(fontWeight: FontWeight.bold),),
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom
              ),

              series: <CartesianSeries<_ChartData, String>>[
                ColumnSeries<_ChartData, String>(
                  spacing: 0.2,
                  borderRadius: BorderRadius.circular(5.r),
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Cash',
                    color: Colors.teal),
                    ColumnSeries<_ChartData, String>(
                      borderRadius: BorderRadius.circular(5.r),
                      spacing: 0.2,
                    dataSource: data2,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Non-Cash',
                    color: Colors.tealAccent)
              ],
              ),
         );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
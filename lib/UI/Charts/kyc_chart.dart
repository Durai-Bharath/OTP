import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class KycChart extends StatefulWidget {
  const KycChart({super.key});

  @override
  State<KycChart> createState() => KycChartState();
}

class KycChartState extends State<KycChart> {
  late List<_ChartData> data;
    late List<_ChartData> data2;

  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('QTR1', 12),
      _ChartData('QTR2', 15),
      _ChartData('QTR3', 30),
      _ChartData('QTR4', 6.4),
      
    ];
        data2 = [
      _ChartData('QTR1', 32),
      _ChartData('QTR2', 35),
      _ChartData('QTR3', 30),
      _ChartData('QTR4', 2.4),
      
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
              title: ChartTitle(text: "Activities",textStyle: TextStyle(fontWeight: FontWeight.bold),),
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom
              ),

              series: <CartesianSeries<_ChartData, String>>[
                BarSeries<_ChartData, String>(
                  spacing: 0.2,
                  borderRadius: BorderRadius.circular(5.r),
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Completed',
                    color: Colors.teal),
                    ColumnSeries<_ChartData, String>(
                      borderRadius: BorderRadius.circular(5.r),
                      spacing: 0.2,
                    dataSource: data2,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Pending',
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
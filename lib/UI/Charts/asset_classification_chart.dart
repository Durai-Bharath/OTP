import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AssetClassificationChart extends StatefulWidget {
  const AssetClassificationChart({super.key});

  @override
  State<AssetClassificationChart> createState() =>
      _AssetClassificationChartState();
}

class _AssetClassificationChartState extends State<AssetClassificationChart> {
   late TooltipBehavior _tooltip;

   @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true,duration: 500);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Loss', 25,Colors.teal),
      ChartData('Standard', 38,Colors.tealAccent),
      ChartData('Doubtfull', 34,Colors.teal.shade200),
      ChartData('Sub Standard', 52,Colors.teal.shade100)
    ];
    return Container(
      height: 400.h,
      width: 400.w,
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
      child: SfCircularChart(
        tooltipBehavior: _tooltip,
        title: ChartTitle(text: "Assets Classification",textStyle: TextStyle(fontWeight: FontWeight.bold)),
        
        series: <CircularSeries>[
          
        PieSeries<ChartData, String>(
          
          dataSource: chartData,
          enableTooltip: true,
          dataLabelMapper: (ChartData data,_)=> '${data.x} \n ${data.y}%',
          pointColorMapper: (ChartData data, _) => data.color,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          dataLabelSettings: DataLabelSettings(
            labelPosition: ChartDataLabelPosition.outside,
            isVisible: true,
          ),
        )
      ]),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

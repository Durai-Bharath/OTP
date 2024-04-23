import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class AlertStrChart extends StatefulWidget {
  const AlertStrChart({super.key});

  @override
  State<AlertStrChart> createState() => _AlertStrChartState();
}

class _AlertStrChartState extends State<AlertStrChart> {
  late TooltipBehavior _tooltip ;
  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true,duration: 500);
    super.initState();
  }
  @override
@override
    Widget build(BuildContext context) {
        final List<ChartData> chartData = [
            ChartData(1924, 400),
            ChartData(1925, 410),
            ChartData(1926, 405),
            ChartData(1927, 410),
            ChartData(1928, 350),
            ChartData(1929, 370),
            ChartData(1930, 500),
            ChartData(1931, 390),
            ChartData(1932, 450),
            ChartData(1933, 440),
            ChartData(1934, 350),
            ChartData(1935, 370),
            ChartData(1936, 480),
            ChartData(1937, 410),
            ChartData(1938, 530),
            ChartData(1939, 520),
            ChartData(1940, 390),
            ChartData(1941, 360),
            ChartData(1942, 405),
            ChartData(1943, 400),
        ];
        final List<Color> color = <Color>[];
        color.add(Colors.teal[50]!);
        color.add(Colors.teal[200]!);
        color.add(Colors.teal);

        final List<double> stops = <double>[];
        stops.add(0.0);
        stops.add(0.5);
        stops.add(1.0);

        final LinearGradient gradientColors =
            LinearGradient(colors: color, stops: stops);
        
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
                child: SfCartesianChart(
                  tooltipBehavior: _tooltip,
                  title: ChartTitle(text: "% Of Alerts Resulting In STR",textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.teal)),
                    primaryYAxis: NumericAxis(labelFormat: '{value}mm'),
                    series: <CartesianSeries>[
                        // Renders area chart
                        AreaSeries<ChartData, int>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                             gradient: gradientColors
                        )
                    ]
                )
            );
    }
}
 class ChartData {
        ChartData(this.x, this.y);
        final int x;
        final double y;
    }
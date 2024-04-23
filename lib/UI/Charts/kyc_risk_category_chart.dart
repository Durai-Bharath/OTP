import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class KyCRiskCategoryChart extends StatefulWidget {
  const KyCRiskCategoryChart({super.key});

  @override
  State<KyCRiskCategoryChart> createState() => _KyCRiskCategoryChartState();
}

class _KyCRiskCategoryChartState extends State<KyCRiskCategoryChart> {
  late TooltipBehavior _tooltip;
   String selectedYearRange = '2020-2021';
  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true, duration: 500);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   

    List<String> yearRanges = [
      '2020-2021',
      '2021-2022',
      '2022-2023',
      '2023-2024',
    ];
    final List<ChartData> chartData1 = [
      ChartData("Jan", 35),
      ChartData("Feb", 13),
      ChartData("Mar", 34),
      ChartData("Apr", 27),
      ChartData("May", 40)
    ];
    final List<ChartData> chartData2 = [
      ChartData("Jan", 15),
      ChartData("Feb", 12),
      ChartData("Mar", 15),
      ChartData("Apr", 10),
      ChartData("May", 20)
    ];
    final List<ChartData> chartData3 = [
      ChartData("Jan", 27),
      ChartData("Feb", 33),
      ChartData("Mar", 12),
      ChartData("Apr", 39),
      ChartData("May", 38)
    ];
    return Container(
      height: 400.h,
      width: 700.w,
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
            padding: EdgeInsets.only(left: 500.w),
            child: DropdownButton<String>(
              // isExpanded: true,

              value: selectedYearRange,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  debugPrint("Triggered onChanged with value: $newValue");
                  setState(() {
                    selectedYearRange = newValue;
                  });
                }
              },
              items: yearRanges.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
            ),
            tooltipBehavior: _tooltip,
            title: ChartTitle(
                text: "KYC Risk Categorization",
                textStyle: TextStyle(fontWeight: FontWeight.bold)),
            legend: Legend(isVisible: true, position: LegendPosition.top),
            series: <CartesianSeries>[
              SplineSeries<ChartData, String>(
                enableTooltip: true,
                dataSource: chartData1,
                splineType: SplineType.cardinal,
                cardinalSplineTension: 0.9,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                name: "High Risk",
                color: Colors.teal,
                width: 5,
              ),
              SplineSeries<ChartData, String>(
                enableTooltip: true,
                dataSource: chartData2,
                splineType: SplineType.cardinal,
                cardinalSplineTension: 0.9,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                name: "Medium Risk",
                color: Colors.tealAccent,
                width: 5,
              ),
              SplineSeries<ChartData, String>(
                enableTooltip: true,
                dataSource: chartData3,
                splineType: SplineType.cardinal,
                cardinalSplineTension: 0.9,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                name: "Low Risk",
                color: Colors.red,
                width: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}

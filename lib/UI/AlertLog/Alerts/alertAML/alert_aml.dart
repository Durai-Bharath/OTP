import 'package:compliance_tablet/UI/AlertLog/Alerts/alertAML/alertAML_volume.dart';
import 'package:compliance_tablet/UI/AlertLog/Alerts/alertAML/alert_STR_chart.dart';
import 'package:compliance_tablet/UI/AlertLog/Alerts/alertAML/outstandingAlerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertAML extends StatefulWidget {
  const AlertAML({super.key});

  @override
  State<AlertAML> createState() => _AlertAMLState();
}

class _AlertAMLState extends State<AlertAML> {
  String selectedBranch = 'ASHOK NAGAR';
  List<String> branch_type = [
    'ASHOK NAGAR',
    'CENTRAL',
    'TAMBARAM',
    'GUINDY',
    'PORUR',
    'T-NAGAR'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "AML",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.green),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(width: 20.w,),
            OutstandingAlerts(),
            SizedBox(
              width: 40.w,
            ),
            AlertAmlVolumeChart(),
            SizedBox(
              width: 40.w,
            ),
            AlertStrChart()
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OutstandingAlerts extends StatefulWidget {
  const OutstandingAlerts({super.key});

  @override
  State<OutstandingAlerts> createState() => _OutstandingAlertsState();
}

class _OutstandingAlertsState extends State<OutstandingAlerts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.h,
      width: 300.w,
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
      child: CircularPercentIndicator(
        radius: 120.0,
        lineWidth: 30.0,
        animation: true,
        percent: 0.0,
        center:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "120",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.bold)
                  // TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Text(
              "Outstanding Alerts",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
             Icon(
              Icons.crisis_alert_sharp,
              color: Colors.amber,
              size: 25.sp,
            )
          ],
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: Colors.teal,
      ),
    );
  }
}

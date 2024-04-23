import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResolutionRateChart extends StatefulWidget {
  const ResolutionRateChart({super.key});

  @override
  State<ResolutionRateChart> createState() => _ResolutionRateChartState();
}

class _ResolutionRateChartState extends State<ResolutionRateChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
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
           Center(child: Text("Resolution Rate",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),)),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 30.0,
                animation: true,
                percent: 0.7,
                center: const Text(
                  "70.0%",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                header: Column(
                  children: [
                    const Text(
                      "Complaints",
                      style: TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
                footer: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                      "7 Days",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.teal,
              ),
              SizedBox(
                width: 20.w,
              ),
              CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 30.0,
                animation: true,
                percent: 0.7,
                center: const Text(
                  "80.0%",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                header: Column(
                  children: [
                    const Text(
                      "CIC Alert",
                      style: TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
                footer: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                      "2 Days",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.teal,
              ),
              SizedBox(
                width: 20.w,
              ),
              CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 30.0,
                animation: true,
                percent: 0.7,
                center: const Text(
                  "99.0%",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                header: Column(
                  children: [
                    const Text(
                      "Call Center Leads",
                      style: TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
                footer: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                      "2 Days",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.teal,
              )
            ],
          ),
        ],
      ),
    );
  }
}

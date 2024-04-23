import 'package:compliance_tablet/UI/Charts/activities_chart.dart';
import 'package:compliance_tablet/UI/Charts/asset_classification_chart.dart';
import 'package:compliance_tablet/UI/Charts/cash_non_cash.dart';
import 'package:compliance_tablet/UI/Charts/dormantAccountChart.dart';
import 'package:compliance_tablet/UI/Charts/info_container.dart';
import 'package:compliance_tablet/UI/Charts/kyc_chart.dart';
import 'package:compliance_tablet/UI/Charts/kyc_risk_category_chart.dart';
import 'package:compliance_tablet/UI/Charts/npa_chart.dart';
import 'package:compliance_tablet/UI/Charts/resolution_rate_chart.dart';
import 'package:compliance_tablet/UI/Top-Side-Nav-Bar/topNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 300.w),
          child: Text(
            "Compliance Dashboard",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          TopNavBar(),
        ],
      ),
      body: MediaQuery.of(context).size.width >= 800
          ? SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        CashNonCashChart(),
                        SizedBox(
                          width: 25.w,
                        ),
                        DormantAccountChart(),
                        SizedBox(
                          width: 25.w,
                        ),
                        ActivitiesChart(),
                        SizedBox(
                          width: 25.w,
                        ),
                        KycChart(),
                        SizedBox(
                          width: 25.w,
                        ),
                        InfoContainer()
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        KyCRiskCategoryChart(),
                        SizedBox(
                          width: 22.w,
                        ),
                        NpaChart(),
                        SizedBox(
                          width: 22.w,
                        ),
                        AssetClassificationChart()
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        ResolutionRateChart(),
                        SizedBox(
                          width: 30.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Column(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    CashNonCashChart(),
                    SizedBox(
                      height: 25.h,
                    ),
                    DormantAccountChart(),
                    SizedBox(
                      height: 25.h,
                    ),
                    ActivitiesChart(),
                    SizedBox(
                      height: 25.h,
                    ),
                    KycChart(),
                    SizedBox(
                      height: 25.h,
                    ),
                    InfoContainer(),
                    SizedBox(
                      height: 25.w,
                    ),
                    KyCRiskCategoryChart(),
                    SizedBox(
                      height: 25.h,
                    ),
                    NpaChart(),
                    SizedBox(
                      height: 25.h,
                    ),
                    AssetClassificationChart(),
                    SizedBox(
                      height: 25.h,
                    ),
                    ResolutionRateChart(),
                    SizedBox(
                      height: 25.h,
                    ),

                    // SizedBox(height: 20.h,),
                    // Row(
                    //   children: [
                    //     SizedBox(width: 10.w,),
                    //     CashNonCashChart(),
                    //     SizedBox(width: 25.w,),
                    //     DormantAccountChart(),
                    //     SizedBox(width: 25.w,),
                    //     ActivitiesChart(),
                    //      SizedBox(width: 25.w,),
                    //     KycChart(),
                    //      SizedBox(width: 25.w,),
                    //     InfoContainer()
                    //   ],
                    // ),
                    //  SizedBox(height: 40.h,),
                    // Row(
                    //   children: [
                    //     SizedBox(width: 10.w,),
                    //     KyCRiskCategoryChart(),
                    //      SizedBox(width: 22.w,),
                    //     NpaChart(),
                    //      SizedBox(width: 22.w,),
                    //      AssetClassificationChart()
                    //   ],
                    // ),
                    //   SizedBox(height: 40.h,),
                    // Row(
                    //   children: [
                    //     SizedBox(width: 10.w,),
                    //     ResolutionRateChart(),
                    //      SizedBox(width: 30.w,),

                    //   ],
                  ],
                ),
              ),
            ),
    );
  }
}

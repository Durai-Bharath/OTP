import 'package:compliance_tablet/UI/AlertLog/Alerts/alertAML/alert_aml.dart';
import 'package:compliance_tablet/UI/AlertLog/Alerts/alert_kyc.dart';
import 'package:compliance_tablet/UI/Top-Side-Nav-Bar/topNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertLog extends StatefulWidget {
  const AlertLog({super.key});

  @override
  State<AlertLog> createState() => _AlertLogState();
}

class _AlertLogState extends State<AlertLog>
    with SingleTickerProviderStateMixin {

      late TabController _tabController;
      @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 300.w),
          child: Text(
            "Alert Log",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: const [
          TopNavBar(),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h,),
          Container(
              child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelStyle: Theme.of(context).textTheme.headlineSmall,
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
             
              indicatorColor: Colors.green,
              isScrollable: true,
              labelPadding: EdgeInsets.only(left: 40.w, right: 20.w),
              tabs: [
                Tab(
                  text: "KYC",
                ),
                Tab(
                  text: "AML",
                ),
                Tab(
                  text: "NPA",
                ),
                Tab(
                  text: "RBI",
                ),
                Tab(
                  text: "Demat Acc",
                ),
                Tab(
                  text: "Tab",
                )
              ],
            ),
          )),
          Container(
            width: double.maxFinite,
            height: 800.h,
            child: TabBarView(controller: _tabController, children: [
              // Text("KYC"),
              AlertKyc(),
              AlertAML(),
              Text("NPA"),
              Text("RBI"),
              Text("Demat Acc"),
              Text("Tab"),
            ]),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertKyc extends StatefulWidget {
  const AlertKyc({super.key});

  @override
  State<AlertKyc> createState() => _AlertKycState();
}

class _AlertKycState extends State<AlertKyc> {
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
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "KYC Dashboard",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.green),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 100.w),
                  child: Row(
                    children: [
                      Text(
                        "BRANCH",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: DropdownButton(
                            padding: EdgeInsets.only(left: 5.w),
                            underline: const SizedBox(),
                            autofocus: false,
                            focusColor: Colors.transparent,
                            value: selectedBranch,
                            items: branch_type
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem(
                                  value: value,
                                  child: Container(
                                    width: 150.w,
                                    child: Text(
                                      value,
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                  ));
                            }).toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedBranch = newValue;
                                });
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 100.w),
              child: Container(
                  height: 100.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black),
                      boxShadow: const [
                        BoxShadow(
                            // offset: Offset(5.0, 5.0),
                            blurRadius: 5,
                            color: Colors.teal,
                            spreadRadius: 2.0),
                        BoxShadow(
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0,
                            color: Colors.white,
                            spreadRadius: 0.0)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                "All Users",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.grey),
                              ),
                              const Icon(
                                Icons.person_2_rounded,
                                color: Colors.teal,
                              )
                            ],
                          ),
                          Text(
                            "200",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Pending",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.grey),
                              ),
                              const Icon(
                                Icons.pending_actions_rounded,
                                color: Colors.teal,
                              )
                            ],
                          ),
                          Text(
                            "15",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                "verified",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.grey),
                              ),
                              const Icon(
                                Icons.security_rounded,
                                color: Colors.teal,
                              )
                            ],
                          ),
                          Text(
                            "23",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  )),
            )
          ],
        )
      ],
    );
  }
}

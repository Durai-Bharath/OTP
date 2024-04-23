import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoContainer extends StatefulWidget {
  const InfoContainer({super.key});

  @override
  State<InfoContainer> createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
          width: 220.w,
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
          child: Column(
            children: [
              SizedBox(height: 50.h,),
              Container(
                width: 130.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: Colors.black45)
                ),
                child: Center(child: Text("CRR Buffer",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),)),
              ),
              Center(child: Text("Rs.2.25 Cr",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold,color: Colors.teal),)),
              SizedBox(height: 50.h,),
              Container(
                width: 130.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: Colors.black45)
                ),
                child: Center(child: Text("SLR Ratio",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),)),
              ),
              Center(child: Text("21.75 %",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold,color: Colors.teal),)),
            ],
          ),


    );
  }
}
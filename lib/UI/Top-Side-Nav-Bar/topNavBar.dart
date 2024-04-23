import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavBar extends StatefulWidget {
  const TopNavBar({super.key});

  @override
  State<TopNavBar> createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 250.w,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black45,),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const[
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                        controller: _controller,
                        style: const TextStyle(color: Colors.black),
                        // onChanged: (value) => debugPrint(value),
                        decoration: const InputDecoration(
                          prefixIcon:  Icon(Icons.search,color: Colors.black45),
                          border: InputBorder.none,
                          hintText: "search for anything",
                        ),
                        textInputAction: TextInputAction.search,       
                      ),
          ),
        ),
        SizedBox(width: 20.w,),
        Container(
          height: 40.h,
          width: 300.w,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal,),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const[
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
          child : Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset("assets/images/profile.jpg",)),
              ),
              SizedBox(width: 20.w,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Ravi Prakash Gupta",style: Theme.of(context).textTheme.bodySmall,),
                  Text("Pune Branch Manager",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black45),)
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(left: 70.w),
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_drop_down)),
              )
            ],
          )
        ),
        SizedBox(width: 20.w,),
        Container(
          height: 45.h,
          width: 45.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
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
          child: IconButton(onPressed: (){}, icon:const Icon(Icons.notification_important_outlined,color: Colors.teal,)),
        ),
        SizedBox(width: 20.w,),
         Container(
          height: 45.h,
          width: 45.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
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
          child: IconButton(onPressed: (){}, icon:const Icon(Icons.headphones_outlined,color: Colors.teal,)),
        ),
        SizedBox(width: 20.w,),
         Container(
          height: 45.h,
          width: 45.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
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
          child: IconButton(onPressed: (){}, icon:const Icon(Icons.refresh_rounded,color: Colors.teal,)),
        ),
        SizedBox(width: 20.w,),
         Container(
          height: 45.h,
          width: 45.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
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
          child: IconButton(onPressed: (){}, icon:const Icon(Icons.send_to_mobile_sharp,color: Colors.teal,)),
        ),
        SizedBox(width: 20.w,)
      ],
    );
  }
}
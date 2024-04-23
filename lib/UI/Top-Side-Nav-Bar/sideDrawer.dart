import 'package:compliance_tablet/UI/AlertLog/alert_log.dart';
import 'package:compliance_tablet/UI/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';

class SiderDrawer extends StatelessWidget {
  SiderDrawer({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
          key: _key,
          appBar: isSmallScreen
              ? AppBar(
                  backgroundColor: Colors.teal,
                  title: Text(_getTitleByIndex(_controller.selectedIndex)),
                  leading: IconButton(
                    onPressed: () {
                      _key.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                )
              : null,
          drawer: SiderBarX(controller: _controller),
          body: Row(
            children: [
              if (!isSmallScreen) SiderBarX(controller: _controller),
              Expanded(
                child: Center(
                  child: _Screens(
                    controller: _controller,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SiderBarX extends StatelessWidget {
  const SiderBarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverTextStyle:const TextStyle(color: Colors.pink,) ,
        hoverColor: Colors.red,
        textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        selectedTextStyle: const TextStyle(color: Colors.teal),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        // itemDecoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10),
        //   border: Border.all(color: Colors.tra),
        // ),
        // selectedItemDecoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10),
        //   border: Border.all(
        //     color: actionColor.withOpacity(0.37),
        //   ),
        //   gradient: const LinearGradient(
        //     colors: [accentCanvasColor, canvasColor],
        //   ),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.black.withOpacity(0.28),
        //       blurRadius: 30,
        //     )
        //   ],
        // ),
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.teal,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return Column(
          children: [
            CircleAvatar(
              // backgroundColor: Colors.blue,
              radius: 80.r,
              child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Image.asset('assets/images/bank.png',height: 170.h,width: 170.w,)),
            ),
            // Container(
            //   height: 40.h,
            //   width: 150.w,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(30.r),
            //     color: Colors.teal
            //   ),
            //   child:  Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       CircleAvatar(
            //         radius: 15.r,
            //         backgroundColor: Colors.white,
            //         child: Icon(Icons.add,color: Colors.teal),
            //       ),
            //       SizedBox(width: 5.w,),
            //       const Text("Create new alert",style: TextStyle(color: Colors.white),)
            //     ],
            //   ),
            // ),
            SizedBox(height: 20.h,)

          ],
        );
      },
      footerBuilder: (context,extended){
        return Column(
          children: [
            Text("Powered By :",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.teal),),
            Image.asset("assets/images/annuity_risk.jpg",height: 100.h,)
          ],
        );
      },

      items: [
        
        SidebarXItem(
          icon: Icons.dashboard,
          label: 'Dashboard',
          onTap: () {
           
          },
        ),
          const SidebarXItem(
          icon: Icons.add,
          label: 'Create new alert',
          
        ),
        
        const SidebarXItem(
          icon: Icons.list_alt,
          label: 'Forms',
        ),
        const SidebarXItem(
          icon: Icons.task_sharp,
          label: 'Tasks',
        ),
        const SidebarXItem(
          icon: Icons.fact_check_sharp,
          label: 'Critical Issues',
        ),
         const SidebarXItem(
          icon: Icons.add_alert_outlined,
          label: 'Alert Log',
        ),
         const SidebarXItem(
          icon: Icons.person_2_outlined,
          label: 'Users',
        ),
         const SidebarXItem(
          icon: Icons.report_sharp,
          label: 'Reports',
        ),
         const SidebarXItem(
          icon: Icons.settings,
          label: 'Settings',
        ),
         const SidebarXItem(
          icon: Icons.headphones,
          label: 'Support',
        ),
      ],
    );
  }
}

class _Screens extends StatelessWidget {
  const _Screens({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return const Dashboard(); 
           case 5:
            return const AlertLog(); 
            // ListView.builder(
            //   padding: const EdgeInsets.only(top: 10),
            //   itemBuilder: (context, index) => Container(
            //     height: 100,
            //     width: double.infinity,
            //     margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       color: Colors.blueAccent,
            //       boxShadow: const [BoxShadow()],
            //     ),
            //   ),
            // );
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Dashboard';
    case 1:
      return 'Create Alert';
    case 2:
      return 'Forms';
    case 3:
      return 'Tasks';
    case 4:
      return 'Critical Issues';
    case 5:
      return 'Alert Log';
    case 6:
      return 'Users';
    case 7:
      return 'Reports';
    case 8:
      return 'Settings';
    case 9:
      return 'Supports';
    default:
      return 'Not found page';
  }
}

// const primaryColor = Color(0xFF685BFF);
// const canvasColor = Color(0xFF2E2E48);
// const scaffoldBackgroundColor = Color(0xFF464667);
// const accentCanvasColor = Color(0xFF3E3E61);
// const white = Colors.white;
// final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);

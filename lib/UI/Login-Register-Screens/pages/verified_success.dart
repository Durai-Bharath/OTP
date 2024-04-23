import 'package:compliance_tablet/UI/Top-Side-Nav-Bar/sideDrawer.dart';
import 'package:compliance_tablet/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class VerifiedSuccess extends StatelessWidget {
  const VerifiedSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if (state is SignInSuccessState || state is SignUpSuccessState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.teal,
                        Colors.white,
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp)),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                        height: 400.h,
                        child: Lottie.asset(
                          "assets/lottify/verified.json",
                        )),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 50.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.teal),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SiderDrawer(),
                            ),
                            (route) => false);
                      },
                      child: Center(
                        child: Text(
                          "Home".toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
            
          }
          return Container();
        },
      ),
    );
  }
}

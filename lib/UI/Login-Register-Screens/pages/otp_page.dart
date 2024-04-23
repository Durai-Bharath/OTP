import 'dart:async';
import 'dart:js_interop_unsafe';

import 'package:compliance_tablet/UI/Login-Register-Screens/pages/verified_success.dart';
import 'package:compliance_tablet/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  StreamController<ErrorAnimationType>? errorController;
  String otp = "";
  bool hasError = false;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is SignInSuccessState || state is SignUpSuccessState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VerifiedSuccess()));

            debugPrint((state as SignInSuccessState).userModel.user_name);

            // formKey.currentState!.validate();
          }
        },
        builder: (context, state) {
          if (state is ProcessingState) {
            return Center(
              child: Container(
                height: 400.h,
                width: 400.w,
                child: const CircularProgressIndicator(
                  backgroundColor: Colors.teal,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  strokeWidth: 10,
                  color: Colors.blue,
                ),
              ),
            );
          }

          if (state is SignUpProcessingState) {
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
                          "assets/lottify/otp.json",
                        )),
                  ),
                  Container(
                    height: 200.h,
                    width: 500.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Text(
                          "Email Verification",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Enter the code sent to mail",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.black45),
                            ),
                            Text(
                              state.userModel.email,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Container(
                          width: 350.w,
                          child: Form(
                            key: formKey,
                            child: PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              length: 6,
                              obscureText: true,
                              obscuringCharacter: "*",
                              blinkWhenObscuring: true,
                              textStyle: const TextStyle(color: Colors.black),
                              blinkDuration: const Duration(microseconds: 500),
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                activeColor: Colors.green,
                                inactiveFillColor: Colors.white,
                                inactiveColor: Colors.black,
                                selectedFillColor: Colors.green,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5.r),
                                fieldHeight: 50.h,
                                fieldWidth: 40.w,
                                activeFillColor: Colors.white,
                              ),
                              cursorColor: Colors.black,
                              animationDuration: Duration(milliseconds: 500),
                              enableActiveFill: true,
                              controller: textEditingController,
                              keyboardType: TextInputType.number,
                              boxShadows: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ],
                              onCompleted: (v) {
                                otp = v;
                                debugPrint("Completed");
                              },
                              onChanged: (value) {
                                debugPrint(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      hasError ? "*Please fill up all the cells properly" : "",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive the code? ",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () => ScaffoldMessenger.of(context)
                            .showSnackBar(
                                SnackBar(content: Text("OTP resend !!"))),
                        child: const Text(
                          "RESEND",
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Center(
                    child: Container(
                      height: 50.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          color: Colors.green.shade300,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.green.shade200,
                                offset: const Offset(1, -2),
                                blurRadius: 5),
                            BoxShadow(
                                color: Colors.green.shade200,
                                offset: const Offset(-1, 2),
                                blurRadius: 5)
                          ]),
                      child: ButtonTheme(
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                SignUpVerifyButtonClickedEvent(
                                    otpid: state.otpid,
                                    otp: otp,
                                    userModel: state.userModel));

                            // // conditions for validating
                            // if (currentText.length != 6 || currentText != "123456") {
                            //   errorController!.add(ErrorAnimationType
                            //       .shake); // Triggering error shake animation
                            //   setState(() => hasError = true);
                            // } else {
                            //   setState(
                            //     () {
                            //       hasError = false;
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //           SnackBar(content: Text("OTP Verified !!")));
                            //     },
                            //   );
                            // }
                          },
                          child: Center(
                            child: Text(
                              "VERIFY".toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
       if (state is SignInProcessigState) {
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
                          "assets/lottify/otp.json",
                        )),
                  ),
                  Container(
                    height: 200.h,
                    width: 500.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Text(
                          "Email Verification",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Enter the code sent to mail",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.black45),
                            ),
                            //_________________________________
                            Text(
                              state.userModel.email,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Container(
                          width: 350.w,
                          child: Form(
                            key: formKey,
                            child: PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              length: 6,
                              obscureText: true,
                              obscuringCharacter: "*",
                              blinkWhenObscuring: true,
                              textStyle: const TextStyle(color: Colors.black),
                              blinkDuration: const Duration(microseconds: 500),
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                activeColor: Colors.green,
                                inactiveFillColor: Colors.white,
                                inactiveColor: Colors.black,
                                selectedFillColor: Colors.green,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5.r),
                                fieldHeight: 50.h,
                                fieldWidth: 40.w,
                                activeFillColor: Colors.white,
                              ),
                              cursorColor: Colors.black,
                              animationDuration: Duration(milliseconds: 500),
                              enableActiveFill: true,
                              controller: textEditingController,
                              keyboardType: TextInputType.number,
                              boxShadows: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ],
                              onCompleted: (v) {
                                otp = v;
                                debugPrint("Completed");
                              },
                              onChanged: (value) {
                                debugPrint(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      hasError ? "*Please fill up all the cells properly" : "",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive the code? ",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () => ScaffoldMessenger.of(context)
                            .showSnackBar(
                                SnackBar(content: Text("OTP resend !!"))),
                        child: const Text(
                          "RESEND",
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Center(
                    child: Container(
                      height: 50.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          color: Colors.green.shade300,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.green.shade200,
                                offset: const Offset(1, -2),
                                blurRadius: 5),
                            BoxShadow(
                                color: Colors.green.shade200,
                                offset: const Offset(-1, 2),
                                blurRadius: 5)
                          ]),
                      child: ButtonTheme(
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                SignInVerifyButtonClickedEvent(
                                    otpid: state.otpid,
                                    otp: otp,
                                    userModel: state.userModel));

                            // // conditions for validating
                            if (currentText.length != 6 || currentText != "123456") {
                              errorController!.add(ErrorAnimationType
                                  .shake); // Triggering error shake animation
                              setState(() => hasError = true);
                            } else {
                              setState(
                                () {
                                  hasError = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("OTP Verified !!")));
                                },
                              );
                            }
                          },
                          child: Center(
                            child: Text(
                              "VERIFY".toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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

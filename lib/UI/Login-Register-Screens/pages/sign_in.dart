import 'package:compliance_tablet/Models/user_model.dart';
import 'package:compliance_tablet/UI/Login-Register-Screens/pages/otp_page.dart';
import 'package:compliance_tablet/UI/Login-Register-Screens/pages/verified_success.dart';
import 'package:compliance_tablet/UI/Login-Register-Screens/snackbar.dart';
import 'package:compliance_tablet/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  bool _obscureTextPassword = true;
  String selectedType = 'Guest';
  List<String> user_type = ['Admin', 'Guest'];

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {

      //   if(state is SignInProcessigState){
      //  CustomSnackBar(context, const Text('Login button pressed'));
      //               Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) => OtpPage()));
      //   }

       if(state is SignInSuccessState){
       CustomSnackBar(context, const Text('SignIn success'));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VerifiedSuccess()));
        }
   if(state is SignInFailureState){
       CustomSnackBar(context, const Text('SignIn failed'));
                   
        }

      },
      builder: (context, state) {

        if(state is ProcessingState){
          return Center(
            child: Container(
              height: 200.h,
              width: 200.w,
              child: const CircularProgressIndicator(
                strokeAlign: BorderSide.strokeAlignCenter,
                strokeWidth: 10,
                color: Colors.blue,
                
                
              ),
            ),
          );
        }
        return Container(
          padding: EdgeInsets.only(top: 23.0.h),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Card(
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0.r),
                    ),
                    child: Container(
                      width: 300.0.w,
                      height: 270.0.h,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0.h,
                                bottom: 20.0.h,
                                left: 25.0.w,
                                right: 25.0.w),
                            child: TextField(
                              focusNode: focusNodeEmail,
                              autofocus: true,
                              controller: loginEmailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0.sp,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.envelope,
                                  color: Colors.black,
                                  size: 22.0.sp,
                                ),
                                hintText: 'Email Address',
                                hintStyle: TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 17.0.sp),
                              ),
                              onSubmitted: (_) {
                                focusNodePassword.requestFocus();
                              },
                            ),
                          ),
                          Container(
                            width: 250.0.w,
                            height: 1.0.h,
                            color: Colors.grey[400],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0.h,
                                bottom: 20.0.h,
                                left: 25.0.w,
                                right: 25.0.w),
                            child: TextField(
                              focusNode: focusNodePassword,
                              controller: loginPasswordController,
                              obscureText: _obscureTextPassword,
                              autofocus: true,
                              style: TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0.sp,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.lock,
                                  size: 22.0.sp,
                                  color: Colors.black,
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 17.0.sp),
                                suffixIcon: GestureDetector(
                                  onTap: _toggleLogin,
                                  child: Icon(
                                    _obscureTextPassword
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    size: 15.0.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              onSubmitted: (_) {
                                _toggleSignInButton();
                              },
                              textInputAction: TextInputAction.go,
                            ),
                          ),
                          Container(
                            width: 250.0.w,
                            height: 1.0.h,
                            color: Colors.grey[400],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0.h,
                                bottom: 20.0.h,
                                left: 25.0.w,
                                right: 25.0.w),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                SizedBox(
                                  child: DropdownButton<String>(
                                      underline: const SizedBox(),
                                      autofocus: false,
                                      focusColor: Colors.transparent,
                                      value: selectedType,
                                      dropdownColor: Colors.grey,
                                      items: user_type
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem(
                                            value: value,
                                            child: Container(
                                                width: 180.w,
                                                child: Text(value)));
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          setState(() {
                                            selectedType = newValue;
                                          });
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 300.0.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(5.0, 5.0),
                            blurRadius: 10.0,
                            spreadRadius: 2),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0),
                      ],
                      gradient: const LinearGradient(
                          colors: <Color>[Colors.teal, Colors.tealAccent],
                          begin: FractionalOffset(0.2, 0.2),
                          end: FractionalOffset(1.0, 1.0),
                          stops: <double>[0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.teal.shade900,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0.h, horizontal: 42.0.w),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0.sp,
                              fontFamily: 'WorkSansBold'),
                        ),
                      ),
                      onPressed: () {
                        context.read<LoginBloc>().add(SignInButtonClickedEvent(
                          context: context,
                              userModel: UserModel(
                                  user_name: "",
                                  email: loginEmailController.text,
                                  password: loginPasswordController.text,
                                  user_type: selectedType),
                            ));
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0.h),
                child: Stack(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'WorkSansMedium'),
                        )),
                    Positioned(
                      bottom: 0,
                      left: 10.w,
                      child: Container(
                        width: 150.w,
                        height: 1.5.h,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: <Color>[
                              Colors.white10,
                              Colors.white,
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 1.0),
                            stops: <double>[0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      width: 100.0.w,
                      height: 1.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0.w, right: 15.0.w),
                      child: Text(
                        'Or',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0.sp,
                            fontFamily: 'WorkSansMedium'),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: <Color>[
                              Colors.white,
                              Colors.white10,
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 1.0),
                            stops: <double>[0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      width: 100.0.w,
                      height: 1.0.h,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0.h, right: 40.0.w),
                    child: GestureDetector(
                      onTap: () => CustomSnackBar(
                          context, const Text('Facebook button pressed')),
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          FontAwesomeIcons.facebookF,
                          color: Color(0xFF0084ff),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0.h),
                    child: GestureDetector(
                      onTap: () => CustomSnackBar(
                          context, const Text('Google button pressed')),
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          FontAwesomeIcons.google,
                          color: Color(0xFF0084ff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleSignInButton() {
    CustomSnackBar(context, const Text('Login button pressed'));
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}

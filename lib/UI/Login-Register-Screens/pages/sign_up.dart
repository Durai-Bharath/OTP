import 'package:compliance_tablet/Models/user_model.dart';
import 'package:compliance_tablet/UI/CustomWidgets/snackbars.dart';
import 'package:compliance_tablet/UI/Login-Register-Screens/pages/otp_page.dart';
import 'package:compliance_tablet/UI/Login-Register-Screens/pages/verified_success.dart';
import 'package:compliance_tablet/UI/Login-Register-Screens/snackbar.dart';
import 'package:compliance_tablet/bloc/login_bloc.dart';
import 'package:compliance_tablet/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeName = FocusNode();

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();

  String selectedType = 'Guest';
  List<String> user_type = ['Admin', 'Guest'];

  @override
  void dispose() {
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    focusNodeEmail.dispose();
    focusNodeName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
          // if(state is SignUpProcessingState){
          //    Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => OtpPage()));
          //           _toggleSignUpButton();
          // }
          // if(state is SignInFailureState){
          //    ScaffoldMessenger.of(context).showSnackBar(errorSnackbar(
          //   "Error Occured .\nPlease try again later"));
          // }
            if(state is SignUpSuccessState){
             Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VerifiedSuccess()));
                    _toggleSignUpButton();
          }
          if(state is SignInFailureState){
             ScaffoldMessenger.of(context).showSnackBar(errorSnackbar(
            "Error Occured .\nPlease try again later"));
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
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      width: 350.0.w,
                      height: 450.0.h,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0.h,
                                bottom: 20.0.h,
                                left: 25.0.w,
                                right: 25.0.w),
                            child: TextField(
                              focusNode: focusNodeName,
                              controller: signupNameController,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              autocorrect: false,
                              style: const TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.user,
                                  color: Colors.black,
                                ),
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 16.0),
                              ),
                              onSubmitted: (_) {
                                focusNodeEmail.requestFocus();
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
                              focusNode: focusNodeEmail,
                              controller: signupEmailController,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              style: const TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.envelope,
                                  color: Colors.black,
                                ),
                                hintText: 'Email Address',
                                hintStyle: TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 16.0),
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
                              controller: signupPasswordController,
                              obscureText: _obscureTextPassword,
                              autocorrect: false,
                              style: const TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: const Icon(
                                  FontAwesomeIcons.lock,
                                  color: Colors.black,
                                ),
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 16.0),
                                suffixIcon: GestureDetector(
                                  onTap: _toggleSignup,
                                  child: Icon(
                                    _obscureTextPassword
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    size: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              onSubmitted: (_) {
                                focusNodeConfirmPassword.requestFocus();
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
                              focusNode: focusNodeConfirmPassword,
                              controller: signupConfirmPasswordController,
                              obscureText: _obscureTextConfirmPassword,
                              autocorrect: false,
                              style: const TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: const Icon(
                                  FontAwesomeIcons.lock,
                                  color: Colors.black,
                                ),
                                hintText: 'Confirm Password',
                                hintStyle: const TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 16.0),
                                suffixIcon: GestureDetector(
                                  onTap: _toggleSignupConfirm,
                                  child: Icon(
                                    _obscureTextConfirmPassword
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    size: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              onSubmitted: (_) {
                                _toggleSignUpButton();
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
                                                width: 230.w,
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
                    margin: EdgeInsets.only(top: 480.0.h),
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

                      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0.h, horizontal: 42.0.w),
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0.sp,
                              fontFamily: 'WorkSansBold'),
                        ),
                      ),
                      onPressed: () {
                        context.read<LoginBloc>().add(SignUpButtonClickedEvent(
                          context: context,
                              userModel: UserModel(
                                  user_name: signupNameController.text,
                                  email: signupEmailController.text,
                                  password:
                                      signupConfirmPasswordController.text,
                                  user_type: selectedType),
                            ));
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleSignUpButton() {
    CustomSnackBar(context, const Text('SignUp success'));
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }
}

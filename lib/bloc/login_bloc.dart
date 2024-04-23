import 'package:bloc/bloc.dart';
import 'package:compliance_tablet/API-Calls/pocketbase.dart';
import 'package:compliance_tablet/Models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SignInButtonClickedEvent>((event, emit) async {
      debugPrint("Hi");
      emit(ProcessingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
         final pb = PocketBaseAuthClass();
         var userModel = event.userModel;
         final bool isloggedin = await pb.login(userModel.email,userModel.password,event.context);
         if(isloggedin){
          return emit(SignInSuccessState(userModel: userModel));
          // final res = await PocketBaseAuthClass().emailotp(userModel.email);
          // if (res != null) {
          //   return emit(
          //       SignInProcessigState(otpid: res, userModel: userModel));
          // }
         }
      } catch (e) {
        return emit(SignInFailureState());
      }
    });

    on<SignUpButtonClickedEvent>((event, emit) async {
      emit(ProcessingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        var userModel = event.userModel;
        bool emailnotexist =
            await PocketBaseAuthClass().checkemailnotexist(userModel.email);
        if (emailnotexist) {
          // final res = await PocketBaseAuthClass().emailotp(userModel.email);
          final res = await PocketBaseAuthClass().signup(event.userModel.user_name, event.userModel.password, event.userModel.password , event.userModel.email, event.userModel.user_type,event.context);
          if (res) {
            return emit(
               SignUpSuccessState(userModel: userModel));
          }
        }
      } catch (e) {
        return emit(SignInFailureState());
      }
    });

    on<SignUpVerifyButtonClickedEvent>((event, emit) async {
      emit(ProcessingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        var userModel = event.userModel;
        final res =
            await PocketBaseAuthClass().verifymailotp(event.otpid, event.otp);
        if (res) {
          return emit(SignUpSuccessState(userModel: userModel));
        }
      } catch (e) {
        return emit(SignUpFailureState());
      }
    });



      on<SignInVerifyButtonClickedEvent>((event, emit) async {
      emit(ProcessingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        var userModel = event.userModel;
        final res =
            await PocketBaseAuthClass().verifymailotp(event.otpid, event.otp);
        if (res) {
          return emit(SignInSuccessState(userModel: userModel));
        }
      } catch (e) {
        return emit(SignInFailureState());
      }
    });

    //      on<VerifySignUpButtonClickedEvent>((event, emit) async{
    //  emit(ProcessingEvent());
    //  await Future.delayed(const Duration(seconds: 1));
    //  try {
    //   var userModel = event.userModel;
    //    return emit(SignUpSuccessState(userModel: userModel));
    //  } catch (e) {
    //    return emit(SignUpFailureState());
    //  }
    // });
  }
}

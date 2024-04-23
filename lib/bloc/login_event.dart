// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {
}

class SignInButtonClickedEvent extends LoginEvent {
  UserModel userModel;
   BuildContext context;
  SignInButtonClickedEvent({
    required this.userModel,
     required this.context
  });
  

}

class SignUpButtonClickedEvent extends LoginEvent{
    UserModel userModel;
    BuildContext context;
  SignUpButtonClickedEvent({
    required this.userModel,
    required this.context
  });
}

class SignUpVerifyButtonClickedEvent extends LoginEvent{
  String otpid;
  String otp;
      UserModel userModel;
  SignUpVerifyButtonClickedEvent({
    required this.otpid,
    required this.otp,
    required this.userModel,
  });
}

class SignInVerifyButtonClickedEvent extends LoginEvent{
  String otpid;
  String otp;
 
      UserModel userModel;
  SignInVerifyButtonClickedEvent({
    required this.otpid,
    required this.otp,
    required this.userModel,
   
  });
}




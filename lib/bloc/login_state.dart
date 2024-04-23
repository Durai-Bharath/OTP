// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
sealed class LoginState extends Equatable {}

final class LoginInitial extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SignInSuccessState extends LoginState {
  UserModel userModel;
  SignInSuccessState({
    required this.userModel,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
  
}

class SignInFailureState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpSuccessState extends LoginState{
    UserModel userModel;
  SignUpSuccessState({
    required this.userModel,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}

class SignUpFailureState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignInProcessigState extends LoginState {
  String otpid;
   UserModel userModel;
  SignInProcessigState({
    required this.userModel,
    required this.otpid
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
  
}

class SignUpProcessingState extends LoginState{
 UserModel userModel;
 String otpid;
  SignUpProcessingState({
    required this.otpid,
    required this.userModel,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}

class ProcessingState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


part of 'login_bloc.dart';

class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginErrorState extends LoginState {
  ErrorLoginModels errorData;

  LoginErrorState(this.errorData);
}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  LoginModels dataLogin;

  LoginSuccessState(this.dataLogin);
}

class LoginErrorNetworkState extends LoginState {
  String? message;

  LoginErrorNetworkState(this.message);
}

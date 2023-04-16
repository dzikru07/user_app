part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialLoginEvent extends LoginEvent {
  LoginFormModels loginForm;

  InitialLoginEvent(this.loginForm);
}

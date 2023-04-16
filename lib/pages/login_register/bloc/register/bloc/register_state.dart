part of 'register_bloc.dart';

class RegisterState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterErrorState extends RegisterState {
  ErrorRegisterModels errorData;

  RegisterErrorState(this.errorData);
}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  RegisterModels dataRegister;

  RegisterSuccessState(this.dataRegister);
}

class ErrorNetworkState extends RegisterState {
  String? message;

  ErrorNetworkState(this.message);
}

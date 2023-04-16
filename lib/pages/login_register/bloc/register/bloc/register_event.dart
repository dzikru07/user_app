part of 'register_bloc.dart';

class RegisterEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegisterEventInitial extends RegisterEvent {
  RegisterFormModels registerForm;

  RegisterEventInitial(this.registerForm);
}

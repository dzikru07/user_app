import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:user_app/pages/login_register/models/login/login_models.dart';

import '../../../models/login/error_login_models.dart';
import '../../../models/login/login_form_models.dart';
import '../../../view_models/login_register_view_models.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<InitialLoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    LoginRegisterViewModels servicePage = LoginRegisterViewModels();
    on<InitialLoginEvent>((event, emit) async {
      // TODO: implement event handler
      try {
        emit(LoginLoadingState());
        final response = await servicePage.postLogin(event.loginForm);
        if (response.data["status"]["kode"] == "success") {
          print(response.data["status"]["kode"]);
          var userData = LoginModels.fromJson(response.data);
          emit(LoginSuccessState(userData));
        } else {
          var userData = ErrorLoginModels.fromJson(response.response);
          emit(LoginErrorState(userData));
        }
      } catch (e) {
        emit(LoginErrorNetworkState(e.toString()));
      }
    });
  }
}

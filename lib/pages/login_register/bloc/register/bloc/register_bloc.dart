import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_app/pages/login_register/models/register/error_register_models.dart';
import 'package:user_app/pages/login_register/models/register/register_models.dart';

import '../../../models/register/register_form_models.dart';
import '../../../view_models/login_register_view_models.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEventInitial, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    LoginRegisterViewModels servicePage = LoginRegisterViewModels();
    on<RegisterEventInitial>((event, emit) async {
      try {
        emit(RegisterLoadingState());
        final response = await servicePage.postRegister(event.registerForm);
        if (response.statusCode == 200 || response.statusCode == 210) {
          final data = jsonDecode(response.body);
          var userData = registerModelsFromJson(jsonEncode(data));
          emit(RegisterSuccessState(userData));
        } else {
          final data = jsonDecode(response.body);
          var userData = errorRegisterModelsFromJson(jsonEncode(data));
          emit(RegisterErrorState(userData));
        }
      } catch (e) {
        emit(ErrorNetworkState(e.toString()));
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:user_app/pages/login_register/models/login/login_form_models.dart';

class LoginFormCubit extends Cubit<LoginFormModels> {
  LoginFormCubit() : super(LoginFormModels(username: "", password: ""));

  void setUsername(String username) {
    emit(LoginFormModels(username: username, password: state.password));
  }

  void setPassword(String password) {
    emit(LoginFormModels(username: state.username, password: password));
  }
}

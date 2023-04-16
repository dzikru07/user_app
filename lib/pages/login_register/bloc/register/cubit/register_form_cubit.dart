import 'package:bloc/bloc.dart';
import 'package:user_app/pages/login_register/models/register/register_form_models.dart';

class RegisterFormCubit extends Cubit<RegisterFormModels> {
  RegisterFormCubit()
      : super(RegisterFormModels(
            email: "",
            hp: "",
            firstname: "",
            lastname: "",
            grup: "",
            role: "",
            tglLahir: "",
            jenisKelamin: 0,
            password: "",
            strictPassword: false,
            referralCode: ""));

  void getData() {
    emit(RegisterFormModels(
        email: state.email,
        hp: state.hp,
        firstname: state.firstname,
        lastname: state.lastname,
        grup: state.grup,
        role: state.role,
        tglLahir: state.tglLahir,
        jenisKelamin: state.jenisKelamin,
        password: state.password,
        strictPassword: state.strictPassword,
        referralCode: state.referralCode));
  }

  void setDataEmail(String email) {
    emit(RegisterFormModels(
        email: email,
        hp: state.hp,
        firstname: state.firstname,
        lastname: state.lastname,
        grup: state.grup,
        role: state.role,
        tglLahir: state.tglLahir,
        jenisKelamin: state.jenisKelamin,
        password: state.password,
        strictPassword: state.strictPassword,
        referralCode: state.referralCode));
  }

  void setHp(String hp) {
    emit(RegisterFormModels(
        email: state.email,
        hp: hp,
        firstname: state.firstname,
        lastname: state.lastname,
        grup: state.grup,
        role: state.role,
        tglLahir: state.tglLahir,
        jenisKelamin: state.jenisKelamin,
        password: state.password,
        strictPassword: state.strictPassword,
        referralCode: state.referralCode));
  }

  void setFirstName(String firstName) {
    emit(RegisterFormModels(
        email: state.email,
        hp: state.hp,
        firstname: firstName,
        lastname: state.lastname,
        grup: state.grup,
        role: state.role,
        tglLahir: state.tglLahir,
        jenisKelamin: state.jenisKelamin,
        password: state.password,
        strictPassword: state.strictPassword,
        referralCode: state.referralCode));
  }

  void setLastName(String lastName) {
    emit(RegisterFormModels(
        email: state.email,
        hp: state.hp,
        firstname: state.firstname,
        lastname: lastName,
        grup: state.grup,
        role: state.role,
        tglLahir: state.tglLahir,
        jenisKelamin: state.jenisKelamin,
        password: state.password,
        strictPassword: state.strictPassword,
        referralCode: state.referralCode));
  }

  void setGroup(String group) {
    emit(RegisterFormModels(
        email: state.email,
        hp: state.hp,
        firstname: state.firstname,
        lastname: state.lastname,
        grup: group,
        role: state.role,
        tglLahir: state.tglLahir,
        jenisKelamin: state.jenisKelamin,
        password: state.password,
        strictPassword: state.strictPassword,
        referralCode: state.referralCode));
  }

  void setRole(String role) {
    emit(RegisterFormModels(
        email: state.email,
        hp: state.hp,
        firstname: state.firstname,
        lastname: state.lastname,
        grup: state.grup,
        role: role,
        tglLahir: state.tglLahir,
        jenisKelamin: state.jenisKelamin,
        password: state.password,
        strictPassword: state.strictPassword,
        referralCode: state.referralCode));
  }

  void setDate(String date) {
    emit(RegisterFormModels(
        email: state.email,
        hp: state.hp,
        firstname: state.firstname,
        lastname: state.lastname,
        grup: state.grup,
        role: state.role,
        tglLahir: date,
        jenisKelamin: state.jenisKelamin,
        password: state.password,
        strictPassword: state.strictPassword,
        referralCode: state.referralCode));
  }

  void setGender(int gender) {
    emit(RegisterFormModels(
        email: state.email,
        hp: state.hp,
        firstname: state.firstname,
        lastname: state.lastname,
        grup: state.grup,
        role: state.role,
        tglLahir: state.tglLahir,
        jenisKelamin: gender,
        password: state.password,
        strictPassword: state.strictPassword,
        referralCode: state.referralCode));
  }

  void setPassword(String password) {
    emit(RegisterFormModels(
        email: state.email,
        hp: state.hp,
        firstname: state.firstname,
        lastname: state.lastname,
        grup: state.grup,
        role: state.role,
        tglLahir: state.tglLahir,
        jenisKelamin: state.jenisKelamin,
        password: password,
        strictPassword: state.strictPassword,
        referralCode: state.referralCode));
  }

  void setReffCode(String reffcode) {
    emit(RegisterFormModels(
        email: state.email,
        hp: state.hp,
        firstname: state.firstname,
        lastname: state.lastname,
        grup: state.grup,
        role: state.role,
        tglLahir: state.tglLahir,
        jenisKelamin: state.jenisKelamin,
        password: state.password,
        strictPassword: state.strictPassword,
        referralCode: reffcode));
  }
}

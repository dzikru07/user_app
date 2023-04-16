import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:unicons/unicons.dart';
import 'package:user_app/pages/login_register/view/form/login/login_button.dart';
import 'package:user_app/pages/login_register/view/form/login/username_form.dart';
import 'package:user_app/pages/login_register/view/form/register/birth_data_form.dart';
import 'package:user_app/pages/login_register/view/form/register/email_form.dart';
import 'package:user_app/pages/login_register/view/form/register/first_name_form.dart';
import 'package:user_app/pages/login_register/view/form/register/gender_form.dart';
import 'package:user_app/pages/login_register/view/form/register/last_name_form.dart';
import 'package:user_app/pages/login_register/view/form/register/phone_form.dart';
import '../../../component/alert/snackbar.dart';
import '../../../style/color.dart';
import '../../../style/text.dart';
import '../bloc/login/bloc/login_bloc.dart';
import '../bloc/login/cubit/login_cubit.dart';
import '../bloc/register/bloc/register_bloc.dart';
import '../bloc/register/cubit/register_form_cubit.dart';
import 'form/login/password_form.dart';
import 'form/register/group_form.dart';
import 'form/register/password_form.dart';
import 'form/register/refferal_form.dart';
import 'form/register/register_button.dart';
import 'form/register/role_form.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterBloc(),
          ),
          BlocProvider(
            create: (context) => RegisterFormCubit(),
          ),
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
          BlocProvider(
            create: (context) => LoginFormCubit(),
          ),
        ],
        child: LoginRegisterPage(),
      ),
    );
  }
}

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  bool activeStatus = false;
  bool _loginStatus = false;

  @override
  Widget build(BuildContext context) {
    //login
    LoginBloc loginFormBloc = context.read<LoginBloc>();
    LoginFormCubit loginLocalData = context.read<LoginFormCubit>();
    //---------------------------------------------------------------
    //register
    RegisterBloc registerFormBloc = context.read<RegisterBloc>();
    RegisterFormCubit registerLocalData = context.read<RegisterFormCubit>();
    //---------------------------------------------------------------

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Track color when the switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.amberAccent;
        }
        // Otherwise return null to set default track color
        // for remaining states such as when the switch is
        // hovered, focused, or disabled.
        return null;
      },
    );

    return ResponsiveBuilder(builder: (context, sizeInformation) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: bgColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: _height / 6,
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 12, right: 12),
                  child: Row(
                    children: [
                      Text(
                        _loginStatus ? "Register" : "Login",
                        style: homeTitleTextStyle,
                      )
                    ],
                  ),
                ),
                //login Form
                !_loginStatus
                    ? Column(
                        children: [
                          Column(
                            children: [
                              UsernameFormLogin(
                                width: _width,
                                sizeWidth: 1.07,
                                loginLocalData: loginLocalData,
                              ),
                              PasswordFormLogin(
                                width: _width,
                                sizeWidth: 1.07,
                                loginLocalData: loginLocalData,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              BlocListener<LoginBloc, LoginState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                  if (state is LoginErrorState) {
                                    AlertApp().mainSnackbar(
                                        context, state.errorData.toString());
                                  } else if (state is LoginErrorNetworkState) {
                                    AlertApp().mainSnackbar(
                                        context, state.message.toString());
                                  } else if (state is LoginSuccessState) {
                                    showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: Center(
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(24),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white),
                                                      margin: EdgeInsets.only(
                                                          bottom: 15),
                                                      child: Icon(
                                                        UniconsLine.thumbs_up,
                                                        color: Colors.green,
                                                        size: 45,
                                                      )),
                                                )));
                                    Future.delayed(Duration(milliseconds: 1500),
                                        () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                          context, "/dashboard");
                                    });
                                  }
                                },
                                child: BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                    if (state is LoginLoadingState) {
                                      return Center(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 15),
                                          child: LoadingAnimationWidget
                                              .twistingDots(
                                            leftDotColor:
                                                const Color(0xFF1A1A3F),
                                            rightDotColor:
                                                const Color(0xFFEA3799),
                                            size: 35,
                                          ),
                                        ),
                                      );
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment: sizeInformation
                                                        .deviceScreenType ==
                                                    DeviceScreenType.tablet ||
                                                sizeInformation
                                                        .deviceScreenType ==
                                                    DeviceScreenType.tablet
                                            ? MainAxisAlignment.center
                                            : MainAxisAlignment.start,
                                        children: [
                                          LoginButton(
                                            width: _width,
                                            loginFormBloc: loginFormBloc,
                                            loginLocalData: loginLocalData,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    :
                    //------------------------------------------------------------------
                    //login Form
                    Column(
                        children: [
                          Column(
                            children: [
                              EmailFormRegister(
                                  width: _width,
                                  sizeWidth: 1.07,
                                  formData: registerLocalData),
                              PhoneFormRegister(
                                width: _width,
                                sizeWidth: 1.07,
                                formData: registerLocalData,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(12.0, 0, 12, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FirstNameFormRegister(
                                      width: _width,
                                      sizeWidth: 2.2,
                                      formData: registerLocalData,
                                    ),
                                    LastNameFormRegister(
                                      width: _width,
                                      sizeWidth: 2.2,
                                      formData: registerLocalData,
                                    ),
                                  ],
                                ),
                              ),
                              GroupFormRegister(
                                width: _width,
                                sizeWidth: 1.07,
                                formData: registerLocalData,
                              ),
                              RoleFormRegister(
                                width: _width,
                                sizeWidth: 1.07,
                                formData: registerLocalData,
                              ),
                              BirthDateFormRegister(
                                width: _width,
                                sizeWidth: 1.07,
                                formData: registerLocalData,
                              ),
                              GenderFormRegister(
                                width: _width,
                                sizeWidth: 1.07,
                                formData: registerLocalData,
                              ),
                              PasswordFormRegister(
                                width: _width,
                                sizeWidth: 1.07,
                                formData: registerLocalData,
                              ),
                              RefferalFormRegister(
                                width: _width,
                                sizeWidth: 1.07,
                                formData: registerLocalData,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              BlocListener<RegisterBloc, RegisterState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                  if (state is RegisterErrorState) {
                                    AlertApp().mainSnackbar(
                                        context,
                                        state.errorData.status.keterangan
                                            .toString());
                                  } else if (state is ErrorNetworkState) {
                                    AlertApp().mainSnackbar(
                                        context, state.message.toString());
                                  } else if (state is RegisterSuccessState) {
                                    showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: Center(
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(24),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white),
                                                      margin: EdgeInsets.only(
                                                          bottom: 15),
                                                      child: Icon(
                                                        UniconsLine.thumbs_up,
                                                        color: Colors.green,
                                                        size: 45,
                                                      )),
                                                )));
                                    Future.delayed(Duration(milliseconds: 1500),
                                        () {
                                      Navigator.pop(context);
                                    });
                                  }
                                },
                                child: BlocBuilder<RegisterBloc, RegisterState>(
                                  builder: (context, state) {
                                    if (state is RegisterLoadingState) {
                                      return Center(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 15),
                                          child: LoadingAnimationWidget
                                              .twistingDots(
                                            leftDotColor:
                                                const Color(0xFF1A1A3F),
                                            rightDotColor:
                                                const Color(0xFFEA3799),
                                            size: 35,
                                          ),
                                        ),
                                      );
                                    }
                                    return RegisterButton(
                                        width: _width,
                                        formData: registerLocalData,
                                        registerbloc: registerFormBloc);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                //------------------------------------------------------------------

                //swicth to login or register
                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _loginStatus ? "Register?" : "Login",
                      style: switchStatusLogin,
                    ),
                    Switch(
                      // This bool value toggles the switch.
                      value: _loginStatus,
                      trackColor: trackColor,
                      thumbColor:
                          const MaterialStatePropertyAll<Color>(Colors.black),
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          _loginStatus = value;
                        });
                      },
                    ),
                  ],
                ),
                //-------------------------------------------------------------------
                Container(
                  width: _width,
                  margin: EdgeInsets.only(top: _height / 6.5),
                  height: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://dzikruarya.my.id/assets/image_public/bottom_pattern.png',
                          ))),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

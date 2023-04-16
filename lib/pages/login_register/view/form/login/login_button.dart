import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:user_app/style/color.dart';
import '../../../../../component/alert/snackbar.dart';
import '../../../../../style/text.dart';
import '../../../bloc/login/bloc/login_bloc.dart';
import '../../../bloc/login/cubit/login_cubit.dart';

class LoginButton extends StatefulWidget {
  LoginButton(
      {required this.width,
      required this.loginFormBloc,
      required this.loginLocalData,
      super.key});

  double width;
  LoginBloc loginFormBloc;
  LoginFormCubit loginLocalData;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return SizedBox(
        width: sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
                sizingInformation.deviceScreenType == DeviceScreenType.tablet
            ? widget.width / 1.07
            : widget.width / 5,
        child: InkWell(
          onTap: () {
            if (widget.loginLocalData.state.username == "" ||
                widget.loginLocalData.state.password == "") {
              AlertApp().mainSnackbar(context, "Lengkapi data!");
            } else {
              widget.loginFormBloc
                  .add(InitialLoginEvent(widget.loginLocalData.state));
            }
          },
          child: Container(
              width: widget.width,
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: mainColor,
                  border: Border.all(width: 0.5, color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),

                      spreadRadius: 5,

                      blurRadius: 10,

                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: Text(
                  "Login",
                  style: addAddressTextButton,
                ),
              )),
        ),
      );
    });
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:unicons/unicons.dart';
import 'package:user_app/component/alert/snackbar.dart';
import 'package:user_app/style/color.dart';

import '../../../../../style/text.dart';
import '../../../bloc/register/bloc/register_bloc.dart';
import '../../../bloc/register/cubit/register_form_cubit.dart';

class RegisterButton extends StatefulWidget {
  RegisterButton(
      {required this.width,
      required this.formData,
      required this.registerbloc,
      super.key});

  RegisterFormCubit formData;
  RegisterBloc registerbloc;
  double width;

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
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
            if (widget.formData.state.email == "" ||
                widget.formData.state.hp == "" ||
                widget.formData.state.firstname == "" ||
                widget.formData.state.lastname == "" ||
                widget.formData.state.grup == "" ||
                widget.formData.state.tglLahir == "" ||
                widget.formData.state.jenisKelamin == 0 ||
                widget.formData.state.password == "") {
              AlertApp().mainSnackbar(context, "Lengkapi data!");
            } else {
              widget.registerbloc
                  .add(RegisterEventInitial(widget.formData.state));
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
                  "Register",
                  style: addAddressTextButton,
                ),
              )),
        ),
      );
    });
  }
}

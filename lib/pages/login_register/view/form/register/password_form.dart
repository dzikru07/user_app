import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:user_app/style/color.dart';

import '../../../../../style/text.dart';
import '../../../bloc/register/cubit/register_form_cubit.dart';

class PasswordFormRegister extends StatefulWidget {
  PasswordFormRegister(
      {required this.width,
      required this.sizeWidth,
      required this.formData,
      Key? key})
      : super(key: key);

  double width, sizeWidth;
  RegisterFormCubit formData;

  @override
  State<PasswordFormRegister> createState() => _PasswordFormRegisterState();
}

class _PasswordFormRegisterState extends State<PasswordFormRegister> {
  //show password text
  bool _showPass = false;
  //-----------------
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width / widget.sizeWidth,
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(width: 0.5, color: Colors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: TextField(
        style: addAddressTextCategory,
        obscureText: !_showPass,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          widget.formData.setPassword(value);
        },
        decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _showPass = !_showPass;
                });
              },
              child: Icon(
                _showPass ? UniconsLine.eye_slash : UniconsLine.eye,
                color: mainColor,
                size: 20,
              ),
            ),
            border: InputBorder.none,
            hintText: widget.formData.state.password == ""
                ? "Password"
                : "**********",
            counterText: "",
            hintStyle: addAddressTextCategory),
      ),
    );
  }
}

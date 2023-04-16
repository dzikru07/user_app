import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../style/text.dart';
import '../../../bloc/login/bloc/login_bloc.dart';
import '../../../bloc/login/cubit/login_cubit.dart';

class UsernameFormLogin extends StatefulWidget {
  UsernameFormLogin(
      {required this.width,
      required this.sizeWidth,
      required this.loginLocalData,
      Key? key})
      : super(key: key);

  double width, sizeWidth;
  LoginFormCubit loginLocalData;

  @override
  State<UsernameFormLogin> createState() => _UsernameFormLoginState();
}

class _UsernameFormLoginState extends State<UsernameFormLogin> {
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
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          widget.loginLocalData.setUsername(value);
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintText: widget.loginLocalData.state.username == ""
                ? "Username"
                : widget.loginLocalData.state.username,
            hintStyle: addAddressTextCategory),
      ),
    );
  }
}

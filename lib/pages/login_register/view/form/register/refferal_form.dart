import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../style/text.dart';
import '../../../bloc/register/cubit/register_form_cubit.dart';

class RefferalFormRegister extends StatefulWidget {
  RefferalFormRegister(
      {required this.width,
      required this.sizeWidth,
      required this.formData,
      Key? key})
      : super(key: key);

  double width, sizeWidth;
  RegisterFormCubit formData;

  @override
  State<RefferalFormRegister> createState() => _RefferalFormRegisterState();
}

class _RefferalFormRegisterState extends State<RefferalFormRegister> {
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
          widget.formData.setReffCode(value);
        },
        decoration: InputDecoration(
            errorStyle: formErrorStyle,
            border: InputBorder.none,
            hintText: widget.formData.state.referralCode == ""
                ? "Refferal Code"
                : widget.formData.state.referralCode,
            counterText: "",
            hintStyle: addAddressTextCategory),
      ),
    );
  }
}

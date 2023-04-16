import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../style/text.dart';
import '../../../bloc/register/cubit/register_form_cubit.dart';

class LastNameFormRegister extends StatefulWidget {
  LastNameFormRegister(
      {required this.width,
      required this.sizeWidth,
      required this.formData,
      Key? key})
      : super(key: key);

  double width, sizeWidth;
  RegisterFormCubit formData;

  @override
  State<LastNameFormRegister> createState() => _LastNameFormRegisterState();
}

class _LastNameFormRegisterState extends State<LastNameFormRegister> {
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
          widget.formData.setLastName(value);
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintText: widget.formData.state.lastname == ""
                ? "Last Name"
                : widget.formData.state.lastname,
            hintStyle: addAddressTextCategory),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../style/text.dart';
import '../../../bloc/register/cubit/register_form_cubit.dart';

class FirstNameFormRegister extends StatefulWidget {
  FirstNameFormRegister(
      {required this.width,
      required this.sizeWidth,
      required this.formData,
      Key? key})
      : super(key: key);

  double width, sizeWidth;
  RegisterFormCubit formData;

  @override
  State<FirstNameFormRegister> createState() => _FirstNameFormRegisterState();
}

class _FirstNameFormRegisterState extends State<FirstNameFormRegister> {
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
          widget.formData.setFirstName(value);
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintText: widget.formData.state.firstname == ""
                ? "Fisrt Name"
                : widget.formData.state.firstname,
            hintStyle: addAddressTextCategory),
      ),
    );
  }
}

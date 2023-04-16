import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../../style/text.dart';
import '../../../bloc/register/cubit/register_form_cubit.dart';

class GroupFormRegister extends StatefulWidget {
  GroupFormRegister(
      {required this.width,
      required this.sizeWidth,
      required this.formData,
      Key? key})
      : super(key: key);

  double width, sizeWidth;
  RegisterFormCubit formData;

  @override
  State<GroupFormRegister> createState() => _GroupFormRegisterState();
}

class _GroupFormRegisterState extends State<GroupFormRegister> {
  var groupUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: widget.width / widget.sizeWidth,
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
      child: DropdownButton<String>(
        underline: Container(
          height: 0,
        ),
        isExpanded: true,
        value: groupUser,
        hint: Text(
          widget.formData.state.grup == ""
              ? "Group User"
              : widget.formData.state.grup,
          style: addAddressTextCategory,
        ),
        icon: Container(
            margin: EdgeInsets.only(right: 10),
            child: const Icon(UniconsLine.angle_down)),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            groupUser = value!;
            widget.formData.setGroup(value);
          });
        },
        items: listPostalCode.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: addAddressTextCategory,
            ),
          );
        }).toList(),
      ),
    );
  }
}

const List<String> listPostalCode = <String>['member'];

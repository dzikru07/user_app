import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:unicons/unicons.dart';
import 'package:user_app/component/format_data/format_date.dart';
import 'package:user_app/style/color.dart';

import '../../../../../style/text.dart';
import '../../../bloc/register/cubit/register_form_cubit.dart';

class BirthDateFormRegister extends StatefulWidget {
  BirthDateFormRegister(
      {required this.width,
      required this.sizeWidth,
      required this.formData,
      Key? key})
      : super(key: key);

  double width, sizeWidth;
  RegisterFormCubit formData;

  @override
  State<BirthDateFormRegister> createState() => _BirthDateFormRegisterState();
}

class _BirthDateFormRegisterState extends State<BirthDateFormRegister> {
  DateTime? birthDate;

  @override
  Widget build(BuildContext context) {
    void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      setState(() {
        birthDate = args.value;
        widget.formData
            .setDate(FormatData().getDataFormat(birthDate!).toString());
      });
      Navigator.pop(context);
    }

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
        onChanged: (value) {},
        decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: Container(
                        width: widget.width / 1.5,
                        height: MediaQuery.of(context).size.height / 2,
                        child: SfDateRangePicker(
                          onSelectionChanged: _onSelectionChanged,
                        )),
                  ),
                );
              },
              child: Icon(
                UniconsLine.calender,
                color: mainColor,
              ),
            ),
            border: InputBorder.none,
            hintText: birthDate == null
                ? 'Tanggal Lahir'
                : FormatData().getDataFormat(birthDate!).toString(),
            hintStyle: addAddressTextCategory),
      ),
    );
  }
}

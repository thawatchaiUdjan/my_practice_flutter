import 'package:authen_ui/components/text_field_container.dart';
import 'package:authen_ui/constants.dart';
import 'package:flutter/material.dart';

class EmailRoundField extends StatelessWidget {
  final IconData icon;
  final String hintTxt;
  final ValueChanged<String> onChange;
  const EmailRoundField({
    Key? key,
    required this.icon,
    required this.hintTxt,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
          hintText: hintTxt,
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: onChange,
      ),
    );
  }
}

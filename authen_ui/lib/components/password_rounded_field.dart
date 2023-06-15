import 'package:authen_ui/components/text_field_container.dart';
import 'package:authen_ui/constants.dart';
import 'package:flutter/material.dart';

class PasswordRoundedField extends StatelessWidget {
  final ValueChanged<String> onChange;
  const PasswordRoundedField({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          hintText: "Password",
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.visiblePassword,
        onChanged: onChange,
      ),
    );
  }
}

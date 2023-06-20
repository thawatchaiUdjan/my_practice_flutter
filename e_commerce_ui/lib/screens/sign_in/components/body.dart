import 'package:e_commerce_ui/components/default_button.dart';
import 'package:e_commerce_ui/constant.dart';
import 'package:e_commerce_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProporScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: getProporScreenHeight(20)),
              Text(
                "Welcome Sign In",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProporScreenWidth(20),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getProporScreenHeight(10)),
              Text(
                "Sign in with your email and password \nor connect with your social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProporScreenHeight(30)),
              SignForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: "Please enter email"),
    EmailValidator(errorText: "Enter valid email"),
  ]);

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: "Please enter password"),
    MinLengthValidator(8, errorText: "Password must be at least 8 digits long"),
    PatternValidator(r'[A-Z]',
        errorText: "Password must be at least one Upper case"),
  ]);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailForm(),
          SizedBox(height: getProporScreenHeight(20)),
          buildPasswordForm(),
          SizedBox(height: getProporScreenHeight(20)),
          DefaulButton(
            textBtn: "CONTINUE",
            onPress: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordForm() {
    return TextFormField(
      obscureText: true,
      validator: emailValidator,
      decoration: InputDecoration(
        hintText: "Enter your password",
        labelText: "Password",
        suffixIcon: CustomSuffixIcon(icon: Icons.vpn_key_outlined),
      ),
    );
  }

  TextFormField buildEmailForm() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: passwordValidator,
      decoration: InputDecoration(
        hintText: "Enter your email",
        labelText: "E-mail",
        suffixIcon: CustomSuffixIcon(icon: Icons.email_outlined),
      ),
    );
  }
}

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProporScreenWidth(10),
        getProporScreenWidth(20),
        getProporScreenWidth(10),
      ),
      child: Icon(
        icon,
        size: getProporScreenWidth(25),
      ),
    );
  }
}

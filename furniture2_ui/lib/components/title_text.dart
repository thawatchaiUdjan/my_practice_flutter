import 'package:flutter/material.dart';
import 'package:furniture2_ui/constants.dart';
import 'package:furniture2_ui/size_config.dart';

class TitleText extends StatelessWidget {
  TitleText({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;
  double defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: kTextHeader.copyWith(fontSize: defaultSize * 1.7),
    );
  }
}

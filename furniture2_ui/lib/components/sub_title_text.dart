import 'package:flutter/material.dart';
import 'package:furniture2_ui/constants.dart';
import 'package:furniture2_ui/size_config.dart';

class SubTitleText extends StatelessWidget {
  SubTitleText({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;
  double defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: kTextSubHeader.copyWith(fontSize: defaultSize * 1.4),
    );
  }
}

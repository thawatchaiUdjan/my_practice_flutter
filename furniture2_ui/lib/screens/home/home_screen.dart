import 'package:flutter/material.dart';
import 'package:furniture2_ui/constants.dart';
import 'package:furniture2_ui/screens/home/components/Body.dart';
import 'package:furniture2_ui/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: SizeConfig.defaultSize * 3,
          color: Colors.black87,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.qr_code_scanner,
            color: Colors.black87,
            size: SizeConfig.defaultSize * 3,
          ),
          onPressed: () {},
        ),
        Center(
          child: Text(
            "Scan",
            style: kTextHeader.copyWith(fontSize: SizeConfig.defaultSize * 1.5),
          ),
        ),
        SizedBox(width: SizeConfig.defaultSize)
      ],
    );
  }
}

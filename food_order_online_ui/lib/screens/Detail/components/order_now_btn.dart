import 'package:flutter/material.dart';
import 'package:food_order_online_ui/constants.dart';

class OrderNowBtn extends StatelessWidget {
  final Function onPress;
  const OrderNowBtn({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * .75,
      child: TextButton.icon(
        icon: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
        label: Text("Order Now"),
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          backgroundColor: kPrimaryColor,
          primary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
              ),
        ),
        onPressed: () => onPress(),
      ),
    );
  }
}

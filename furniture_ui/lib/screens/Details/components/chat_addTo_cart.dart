import 'package:flutter/material.dart';
import 'package:furniture_ui/constants.dart';

class ChatAndAddToCart extends StatelessWidget {
  const ChatAndAddToCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          TextButton.icon(
            icon: Icon(Icons.chat),
            label: Text("Chat"),
            style: TextButton.styleFrom(
              primary: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: 18,
                horizontal: kDefaultPadding,
              ),
            ),
            onPressed: () {},
          ),
          Spacer(),
          Material(
            color: Colors.transparent,
            child: TextButton.icon(
              label: Icon(Icons.shopping_bag),
              icon: Text("Add to Cart"),
              style: TextButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: kDefaultPadding,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

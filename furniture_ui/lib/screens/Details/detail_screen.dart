import 'package:flutter/material.dart';
import 'package:furniture_ui/constants.dart';
import 'package:furniture_ui/models/product.dart';
import 'package:furniture_ui/screens/Details/components/body.dart';

class DetailScreen extends StatelessWidget {
  final Product _product;

  const DetailScreen({required Product product, Key? key})
      : _product = product,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "BACK",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.local_mall_outlined,
              color: kPrimaryColor,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Body(product: _product),
    );
  }
}

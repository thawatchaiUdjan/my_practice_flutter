import 'package:flutter/material.dart';
import 'package:food_delivery_ui/constants.dart';

class DetailScreen extends StatefulWidget {
  final food, in_cart;
  DetailScreen({Key? key, required this.food, required this.in_cart})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState(food, in_cart);
}

class _DetailScreenState extends State<DetailScreen> {
  final food;
  int in_cart;
  _DetailScreenState(
    this.food,
    this.in_cart,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context, in_cart),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.transparent),
                    padding: EdgeInsets.only(bottom: 25, right: 25),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kBlackColor.withOpacity(.5),
                      size: 30,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/icons/menu.png",
                  color: kBlackColor,
                  scale: 1.7,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.all(10),
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSecondaryColor.withOpacity(.5),
              ),
              child: Hero(
                tag: 'food-image-${food['image']}',
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/${food['image']}"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: food["title"] + "\n",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      TextSpan(
                        text: food["ingredient"],
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
                Text(
                  "\$${food['price']}",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: kPrimaryColor),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              food['description'],
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: kTextColor.withOpacity(.65)),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => addToCart(),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: kPrimaryColor.withOpacity(.6),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "ADD TO CART",
                          style: Theme.of(context).textTheme.button,
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: kBlackColor.withOpacity(.6),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor.withOpacity(.6),
                          ),
                          child: Icon(
                            Icons.shopping_basket,
                            color: kBlackColor.withOpacity(.8),
                            size: 35,
                          ),
                        ),
                      ),
                      if (in_cart != 0)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            alignment: Alignment.center,
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kPrimaryColor,
                            ),
                            child: Text(
                              '$in_cart',
                              style:
                                  TextStyle(color: kBlackColor, fontSize: 17),
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Add success."),
      duration: Duration(milliseconds: 300),
    ));
    setState(() {
      in_cart++;
    });
  }
}

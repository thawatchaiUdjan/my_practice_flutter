import 'package:flutter/material.dart';
import 'package:food_delivery_ui/constants.dart';
import 'package:food_delivery_ui/data.dart';
import 'package:food_delivery_ui/detail_screen.dart';
import 'package:food_delivery_ui/widgets/catagory_title_widget.dart';
import 'package:food_delivery_ui/widgets/food_card_widget.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kPrimaryColor,
        textTheme: TextTheme(
            headline1: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: kTextColor,
            ),
            headline2: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: kTextColor,
            ),
            headline3: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: kTextColor,
            ),
            subtitle1: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: kTextColor.withOpacity(.4),
            ),
            button: TextStyle(
              fontWeight: FontWeight.bold,
            )),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final List foods;
  late final List category;
  late int in_cart;

  @override
  void initState() {
    super.initState();
    foods = FoodItem().foodItem;
    category = FoodItem().foodCtg;
    _tabController = TabController(length: category.length, vsync: this);
    in_cart = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(.5),
              spreadRadius: 3,
              blurRadius: 0,
              offset: Offset(2, 1),
            ),
          ],
        ),
        child: Icon(Icons.add, color: kWhiteColor, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SIMPLE WAY TO FIND \nFOOD",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Image.asset(
                    "assets/icons/menu.png",
                    color: kBlackColor,
                    scale: 1.7,
                  ),
                ],
              ),
            ),

            TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelStyle: Theme.of(context).textTheme.button,
              labelColor: kPrimaryColor,
              unselectedLabelColor: kBlackColor.withOpacity(.3),
              tabs: <Widget>[
                ...category.map((title) => CatagoryTitle(title: title)),
              ],
            ),
            //Search field
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: kBorderColor),
              ),
              child: Icon(
                Icons.search,
                color: kBlackColor.withOpacity(.3),
              ),
            ),
            Expanded(
              flex: 3,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  ...category.map((ctgTitle) => buildFoodListView(ctgTitle)),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  Widget buildFoodListView(String category) {
    var foodsSelect = foods;
    if (category.toLowerCase() != "all") {
      //sort of category
      foodsSelect = foods
          .where((e) =>
              e['category'].toString().toLowerCase() == category.toLowerCase())
          .toList();
    }
    return foodsSelect.isNotEmpty
        ? Scrollbar(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodsSelect.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async => in_cart = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      food: foodsSelect[index],
                      in_cart: in_cart,
                    ),
                  ),
                ),
                child: FoodCard(
                  title: foodsSelect[index]["title"].toString(),
                  ingredient: foodsSelect[index]["ingredient"].toString(),
                  description: foodsSelect[index]["description"].toString(),
                  calories:
                      int.parse(foodsSelect[index]["calories"].toString()),
                  price: int.parse(foodsSelect[index]["price"].toString()),
                  image: foodsSelect[index]["image"].toString(),
                ),
              ),
            ),
          )
        : Center(child: Text("No data (T_T )\""));
  }
}

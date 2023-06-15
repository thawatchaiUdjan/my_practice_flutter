import 'package:flutter/material.dart';
import 'package:food_order_online_ui/models/food.dart';
import 'package:food_order_online_ui/screens/Detail/details_screen.dart';
import 'package:food_order_online_ui/screens/Home/components/food_card.dart';

class CategoryView extends StatelessWidget {
  final List<String> category;
  final TabController tabController;
  const CategoryView({
    Key? key,
    required this.tabController,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      height: size.height * .3,
      width: double.infinity,
      child: TabBarView(
        controller: tabController,
        children: [
          ...category
              .map((categoryName) => buildListItemFood(
                    categoryName.toLowerCase(),
                  ))
              .toList()
        ],
      ),
    );
  }

  Widget buildListItemFood(String categoryName) {
    final List<Food> tmpFoods = categoryName != "all"
        ? foods.where((item) => item.category == categoryName).toList()
        : foods;
    return ListView.builder(
      itemCount: tmpFoods.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => FoodCard(
        title: tmpFoods[index].title.toString(),
        shopName: tmpFoods[index].shopName.toString(),
        image: tmpFoods[index].icon.toString(),
        onPress: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(food: tmpFoods[index]),
          ),
        ),
      ),
    );
  }
}

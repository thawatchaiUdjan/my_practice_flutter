import 'package:flutter/material.dart';
import 'package:food_order_online_ui/constants.dart';

class CategoryTabBar extends StatelessWidget {
  const CategoryTabBar({
    Key? key,
    required TabController tabController,
    required this.category,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final List<String> category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: kPrimaryColor,
        labelColor: kTextColor,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelColor: kSecondaryColor,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        tabs: <Widget>[
          ...category.map((title) => Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(title),
              )),
        ],
      ),
    );
  }
}

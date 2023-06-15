import 'package:flutter/material.dart';
import 'package:furniture_ui/constants.dart';

class TabBarCategory extends StatelessWidget {
  final TabController _tabCtrCategory;
  final List<String> _category;
  const TabBarCategory({
    Key? key,
    required TabController tabCtrCategory,
    required List<String> category,
  })  : _tabCtrCategory = tabCtrCategory,
        _category = category,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPadding / 2,
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: kDefaultPadding,
      ),
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: _tabCtrCategory,
        isScrollable: true,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white.withOpacity(.6),
        indicator: BoxDecoration(
          color: Colors.white.withOpacity(.3),
          borderRadius: BorderRadius.circular(5),
        ),
        tabs: [
          ..._category
              .map((value) => Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(value),
                  ))
              .toList()
        ],
      ),
    );
  }
}

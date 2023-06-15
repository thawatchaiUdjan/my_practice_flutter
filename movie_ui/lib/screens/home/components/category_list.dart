import 'package:flutter/material.dart';
import 'package:movie_ui/constants.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList>
    with TickerProviderStateMixin {
  final List<String> categorys = ["In Theater", "Box Office", "Coming Soon"];

  late final TabController _tabCtgController;

  @override
  void initState() {
    _tabCtgController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
      child: TabBar(
        controller: _tabCtgController,
        isScrollable: true,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: kSecondaryColor, width: 4),
          insets: EdgeInsets.only(right: 80),
        ),
        labelPadding: EdgeInsets.only(right: kDefaultPadding * 1.5, bottom: 10),
        unselectedLabelColor: kTextLightColor,
        labelColor: kTextColor,
        labelStyle: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.w600),
        tabs: [...categorys.map((name) => Text(name)).toList()],
      ),
    );
  }
}

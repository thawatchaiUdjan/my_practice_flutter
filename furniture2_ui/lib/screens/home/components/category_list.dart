import 'package:flutter/material.dart';
import 'package:furniture2_ui/models/Categories.dart';
import 'package:furniture2_ui/screens/home/components/category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          categories.length,
          (index) => CategoryCard(category: categories[index]),
        ),
      ),
    );
  }
}

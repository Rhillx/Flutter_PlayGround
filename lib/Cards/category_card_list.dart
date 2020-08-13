import 'package:charts/Cards/category_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategortyCardList extends StatelessWidget {
  List<CategoryCardModel> data = [
    CategoryCardModel(Colors.red, 'Database', FontAwesomeIcons.database),
    CategoryCardModel(
        Colors.blue, 'Authentication', FontAwesomeIcons.shieldAlt),
    CategoryCardModel(Colors.yellow, 'UI', FontAwesomeIcons.code),
    CategoryCardModel(
        Colors.deepOrange, 'Functionality', FontAwesomeIcons.terminal),
    CategoryCardModel(Colors.greenAccent, 'Debugging', FontAwesomeIcons.bug),
    CategoryCardModel(
        Colors.deepPurpleAccent, 'Deployment', FontAwesomeIcons.server),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, i) =>
              CategoryCard(data[i].color, data[i].title, data[i].icon)),
    );
  }
}

class CategoryCardModel {
  Color color;
  String title;
  IconData icon;

  CategoryCardModel(this.color, this.title, this.icon);
}

import 'package:charts/Cards/category_card.dart';
import 'package:charts/Slivers/slivers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategortyCardList extends StatelessWidget {
  final List<CategoryCardModel> data = [
    CategoryCardModel(Colors.red, 'Database', FontAwesomeIcons.database),
    CategoryCardModel(
        Colors.blue, 'Authentication', FontAwesomeIcons.shieldAlt),
    CategoryCardModel(Colors.yellow, 'UI Design', FontAwesomeIcons.code),
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
          itemBuilder: (context, i) => GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SliversPlay(
                          data[i].title, data[i].color, data[i].icon))),
              child: CategoryCard(data[i].color, data[i].title, data[i].icon))),
    );
  }
}

class CategoryCardModel {
  Color color;
  String title;
  IconData icon;

  CategoryCardModel(this.color, this.title, this.icon);
}

class CategoryDetail extends StatelessWidget {
  final String category;
  final Color color;
  final IconData icon;

  CategoryDetail(this.category, this.color, this.icon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(this.icon),
        backgroundColor: this.color,
        title: Text(this.category),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('1'),
            Text('2'),
            Text('3'),
          ],
        ),
      ),
    );
  }
}

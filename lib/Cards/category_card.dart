import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryCard extends StatelessWidget {
  final Color _color;
  final String _cardName;
  final IconData _icon;

  CategoryCard(this._color, this._cardName, this._icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // width: 300,
      decoration: BoxDecoration(
          // shape: BoxShape.rectangle,
          // boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 3)],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_color, Colors.grey[300]])),
      child: Stack(
        children: <Widget>[
          Positioned(
              right: -5,
              top: -10,
              child: Icon(
                _icon,
                size: 80,
                color: Colors.grey[300],
              )),
          Positioned(
              top: 50,
              left: 20,
              child: Text(
                _cardName,
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    letterSpacing: 1.2),
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CheckList extends StatefulWidget {
  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  // bool isChecked = false;

  List<TodoItem> data = [
    TodoItem('Plumbing'),
    TodoItem('HVAC'),
    TodoItem('Electrical'),
    TodoItem('Roofing'),
    TodoItem('Landscaping'),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) => CheckboxListTile(
                    // key: Key(data[i]._title),
                    title: Text(data[i]._title),
                    value: data[i]._isChecked,
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.redAccent,
                    onChanged: (val) {
                      data[i]._isChecked = val;
                      setState(() {
                        null;
                      });
                      print(data[i]._title + ':');
                      print(data[i]._isChecked);
                    }))));
  }
}

class TodoItem {
  bool _isChecked = false;
  final String _title;

  TodoItem(this._title);
}

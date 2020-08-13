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
                    title: Text(data[i].title),
                    value: data[i].isChecked,
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.redAccent,
                    onChanged: (val) {
                      data[i].isChecked = val;
                      setState(() {
                        null;
                      });
                      print(data[i].title + ':');
                      print(data[i].isChecked);
                    }))));
  }
}

class TodoItem {
  bool isChecked = false;
  final String title;

  TodoItem(this.title);
}

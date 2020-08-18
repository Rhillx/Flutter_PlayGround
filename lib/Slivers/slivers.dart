import 'package:charts/CheckList/checklist.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SliversPlay extends StatefulWidget {
  final String category;
  final Color color;
  final IconData icon;

  SliversPlay(this.category, this.color, this.icon);

  @override
  _SliversPlayState createState() => _SliversPlayState();
}

class _SliversPlayState extends State<SliversPlay> {
  TextEditingController input = TextEditingController();
  final List<TodoItem> completedTask = [];
  final List<TodoItem> incompleteTask = [];
  final List notes = [];

  _inputModal() {
    return AlertDialog(
      title: Text('Enter text'),
      content: TextFormField(
        controller: input,
        decoration: InputDecoration(hintText: 'Enter Task or Note'),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              _addTask(input.text);
              input.text = '';
              Navigator.pop(context);
            },
            child: Text('Add Task')),
        FlatButton(
            onPressed: () {
              _addNote(input.text);
              input.text = '';
              Navigator.pop(context);
            },
            child: Text('Add Note')),
      ],
    );
  }

  _addTask(text) {
    setState(() {
      incompleteTask.add(TodoItem(text));
    });
  }

  _addNote(text) {
    setState(() {
      notes.add(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: this.widget.color,
            title: Text(this.widget.category),
            leading: Icon(this.widget.icon),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(FontAwesomeIcons.plusCircle),
                      onPressed: () {
                        return showDialog(
                            context: context,
                            builder: (context) => _inputModal());
                      }))
            ],
            centerTitle: true,
            pinned: true,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                centerTitle: true,
                background: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 120,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          incompleteTask.length.toString() + ' Incomplete',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(completedTask.length.toString() + ' Completed',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        Text(notes.length.toString() + ' Notes',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ],
                )),
          ),
          SliverFillRemaining(
              child: ListView.builder(
                  itemCount: incompleteTask.length,
                  itemBuilder: (context, i) {
                    var taskCheck = incompleteTask[i].isChecked;
                    return GestureDetector(
                      onLongPress: () {
                        incompleteTask.removeWhere(
                            (e) => e.title == incompleteTask[i].title);

                        setState(() {});
                      },
                      child: CheckboxListTile(
                          title: RichText(
                            text: TextSpan(
                                text: incompleteTask[i].title,
                                style: TextStyle(
                                    decoration:
                                        incompleteTask[i].isChecked == false
                                            ? TextDecoration.none
                                            : TextDecoration.lineThrough,
                                    color: taskCheck == false
                                        ? Colors.black
                                        : Colors.red)),
                          ),
                          value: incompleteTask[i].isChecked,
                          onChanged: (val) {
                            incompleteTask[i].isChecked = val;
                            setState(() {});
                          }),
                    );
                  }))
        ],
      ),
      floatingActionButton:
          IconButton(icon: Icon(FontAwesomeIcons.plusCircle), onPressed: () {}),
    );
  }
}

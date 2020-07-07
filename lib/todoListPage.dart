import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfirstapp/new_list.dart';
import 'const.dart';
import 'new_list.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List App'),
      ),
      body: TodoListBody(),
      backgroundColor: Colors.blueGrey,
    );
  }
}

class TodoListBody extends StatefulWidget {
  @override
  _TodoListBodyState createState() => _TodoListBodyState();
}

class _TodoListBodyState extends State<TodoListBody> {

 
  final List<NewListAdd> _addList = [];

  final customController = TextEditingController();

  void _deleteList(String id) {
    setState(() {
      _addList.removeWhere((list) => list.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Text(
            DateFormat.yMMMd().format(DateTime.now()),
            textAlign: TextAlign.center,
            style: kDateStyle,
          ),
        ),
        TextField(
          decoration: InputDecoration(hintText: 'Enter here'),
          controller: customController,
          autocorrect: false,
        ),
        RaisedButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              if (customController.text.isEmpty) {
                return;
              }
              _addList.add(
                NewListAdd(
                    id: DateTime.now().toString(),
                    customList: customController.text),
              );

              customController.clear();

            });
          },
        ),
        NewList(
          addList: _addList,
          deleteList: _deleteList,
        ),
      ],
    );
  }
}

class NewList extends StatelessWidget {
  final List<NewListAdd> addList;
  final Function deleteList;

  NewList({this.addList, this.deleteList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(addList[index].customList),
                  FlatButton(
                      child: Icon(Icons.delete),
                      onPressed: () => deleteList(addList[index].id)),
                ],
              ),
            ),
          );
        },
        itemCount: addList.length,
      ),
    );
  }
}

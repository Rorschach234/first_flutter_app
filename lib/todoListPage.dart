
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'const.dart';

class TodoList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List App'),
      ),
      body: TodoListBody(),
    );
  }
}

class TodoListBody extends StatefulWidget {



  @override
  _TodoListBodyState createState() => _TodoListBodyState();
}

class _TodoListBodyState extends State<TodoListBody> {
 static var dt = DateTime.now();
  static var newFormat = DateFormat("yMMMEd");
  String updatedDt = newFormat.format(dt);


List<Widget> listBox = [];



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Text(
           updatedDt,
            textAlign: TextAlign.center,
            style: kDateStyle,
          ),
        ),
        FlatButton(
          child: Icon(Icons.add),
          onPressed: (){
            setState(() {
              listBox.add(NewList(onPress: () {
                setState(() {
                  listBox.removeAt(0);
                });
              },));
              print(listBox.length);
            });
          },
        ),
        Flexible(
          child: ListView.builder(
            itemCount: listBox.length,
              itemBuilder: (BuildContext context, int index){
                return listBox[index];
          }
          ),
        ),
      ],
    );
  }
}






class NewList extends StatelessWidget {

final Function onPress;

NewList({this.onPress});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      color: Colors.redAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter here'
              ),
            ),
          ),
          FlatButton(
            child: Icon(Icons.delete),
            onPressed: onPress ,
          ),
        ],
      ),
    );
  }
}

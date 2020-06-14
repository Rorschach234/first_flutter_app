import 'package:flutter/material.dart';
import 'package:myfirstapp/home_page.dart';
import 'package:myfirstapp/todoListPage.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to my first App'),
        ),
        body: FrontPage(),
      ),
    );
  }
}

class FrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 300,
              child: Image(
                image: AssetImage('images/surr-done.png'),
              ),
            ),
            Button1(
              titleButton: 'Simple Calculator',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Button1(
              titleButton: 'Todo List App',
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TodoList()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class Button1 extends StatelessWidget {
  Button1({this.titleButton, this.onPress});
  final String titleButton;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      child: Container(
        child: Center(
          child: Text(
            titleButton,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.teal, borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

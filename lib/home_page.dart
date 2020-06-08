import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/services.dart';
import 'firstApp_brain.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to my first App'),
      ),
      body: NumberTest(),
    );
  }
}

class NumberTest extends StatefulWidget {
  @override
  _NumberTestState createState() => _NumberTestState();
}




class _NumberTestState extends State<NumberTest> {

  final number1Controller = TextEditingController();
  final number2Controller = TextEditingController();

  double result = 0;

 String mathSymbol = 'X';


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Press operator symbol to change'),
          ),
          Container(
            width: 200,
            child: TextField(
              controller: number1Controller,

              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter number',
              ),
            ),
          ),
          FlatButton(
            onPressed: (){
              setState(() {
                if (mathSymbol == 'X'){
                  mathSymbol = '+';
                } else {
                  mathSymbol = 'X';
                }
              });
            },
            child: SizedBox(
              height: 60,
              child: Text(
                mathSymbol, style: TextStyle(
                fontSize: 50
              ),
              ),
            ),
          ),
          Container(
            width: 200,
            child: TextField(
              controller: number2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter number',
              ),
            ),
          ),
          SizedBox(
            height: 20,
            child: Text('='),
          ),
          FlatButton(
            onPressed: () {
              setState(() {


                FirstAppBrain multiple = FirstAppBrain(num1: double.parse(number1Controller.text), num2: double.parse(number2Controller.text));

                if(mathSymbol == 'X') {
                  result = multiple.multipleNumbers();
                } else {
                  result = multiple.addingNumbers();
                }

              });
            },
            child: Container(
              child: Center(
                child: Text(
                  'Calculate',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.redAccent, borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Container(
            child: Text(result.toString(),
              style: TextStyle(fontSize: 100),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Button1(
              titleButton: 'Back',
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

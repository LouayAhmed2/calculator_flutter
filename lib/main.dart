import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Claculator();
  }
}

class _Claculator extends State<Calculator> {
  String text = '0';
  double numone = 0;
  double numtwo = 0;
  String result = '0';
  String finalresult = '0';
  String operation = '';
  String pervOperation = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 60),
                    maxLines: 1,
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("AC", Colors.grey, Colors.black, 1),
                button("+/-", Colors.grey, Colors.black, 1),
                button("%", Colors.grey, Colors.black, 1),
                button("÷", Colors.amber, Colors.white, 1)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("7", Color(0xff323232), Colors.white, 1),
                button("8", Color(0xff323232), Colors.white, 1),
                button("9", Color(0xff323232), Colors.white, 1),
                button("x", Colors.amber, Colors.white, 1)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("4", Color(0xff323232), Colors.white, 1),
                button("5", Color(0xff323232), Colors.white, 1),
                button("6", Color(0xff323232), Colors.white, 1),
                button("-", Colors.amber, Colors.white, 1)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("1", Color(0xff323232), Colors.white, 1),
                button("2", Color(0xff323232), Colors.white, 1),
                button("3", Color(0xff323232), Colors.white, 1),
                button("+", Colors.amber, Colors.white, 1)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("0", Color(0xff323232), Colors.white, 0),
                button(".", Color(0xff323232), Colors.white, 1),
                button("=", Colors.amber, Colors.white, 1)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget button(String btntxt, Color colorbtn, Color txtcolor, int num) {
    Container container;
    if (num == 0) {
      container = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: () {
            Calculate(btntxt);
          },
          child: Text(
            btntxt,
            style: TextStyle(fontSize: 30),
          ),
          color: colorbtn,
          textColor: txtcolor,
          padding: EdgeInsets.only(left: 81, top: 20, right: 81, bottom: 20),
          shape: StadiumBorder(),
        ),
      );
    } else {
      container = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: () {
            Calculate(btntxt);
          },
          child: Text(
            btntxt,
            style: TextStyle(fontSize: 30),
          ),
          color: colorbtn,
          textColor: txtcolor,
          padding: EdgeInsets.all(20),
          shape: CircleBorder(),
        ),
      );
    }
    return container;
  }

  void Calculate(txtBtn) {
    if (txtBtn == 'AC') {
      text = '0';
      numone = 0;
      numtwo = 0;
      result = '0';
      finalresult = '0';
      operation = '0';
      pervOperation = '0';
    } else if (operation == '=' && txtBtn == '=') {
      switch (pervOperation) {
        case '+':
          finalresult == add();
          break;
        case '-':
          finalresult == sub();
          break;
        case 'x':
          finalresult == mult();
          break;
        case '÷':
          finalresult = div();
          break;
      }
    } else if (txtBtn == '+' ||
        txtBtn == '-' ||
        txtBtn == '*' ||
        txtBtn == '/' ||
        txtBtn == '=') {
      if (numone == 0) {
        numone = double.parse(result);
      } else {
        numtwo = double.parse(result);
      }
      switch (operation) {
        case '+':
          finalresult = add();
          break;
        case 'x':
          finalresult == mult();
          break;
        case '-':
          finalresult = sub();
          break;
        case '÷':
          finalresult = div();
          break;
      }
      pervOperation = operation;
      operation = txtBtn;
      result = '';
    } else {
      if (result == '0') {
        result = txtBtn;
      } else
        result = result + txtBtn;
      finalresult = result;
    }
    setState(() {
      text = finalresult;
    });
  }

  String add() {
    result = (numone + numtwo).toString();
    numone = double.parse(result);
    return result;
  }

  String sub() {
    result = (numone - numtwo).toString();
    numone = double.parse(result);
    return result;
  }

  String mult() {
    result = (numone * numtwo).toString();
    numone = double.parse(result);
    return result;
  }

  String div() {
    result = (numone / numtwo).toString();
    numone = double.parse(result);
    return result;
  }
}

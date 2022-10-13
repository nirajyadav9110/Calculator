import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstnum = 0;
  int secondnum = 0;
  String textToDisplay = "";
  String res = '';
  String opratorToPerform = '';

  void btnclicked(String val) {
    setState(() {
      if (val == "C") {
        textToDisplay = "aa";
        firstnum = 0;
        secondnum = 0;
        res = "";
        opratorToPerform = '';
        print("pressed c");
      } else if (val == "+" || val == "-" || val == "x" || val == "/") {
        opratorToPerform = val;
      } else if (val == "=") {
        if (opratorToPerform == "+") {
          res = (firstnum + secondnum).toString();
        }
        if (opratorToPerform == "-") {
          res = (firstnum - secondnum).toString();
        }
        if (opratorToPerform == "x") {
          res = (firstnum * secondnum).toString();
          textToDisplay = res;
        }
        if (opratorToPerform == "/") {
          res = (firstnum ~/ secondnum).toString();
        }
      } else if (opratorToPerform == "") {

        firstnum = int.parse(val);
        textToDisplay = firstnum.toString();
      } else if (opratorToPerform != "") {
        secondnum = int.parse(val);
      } else {
        res = int.parse(textToDisplay).toString();
      }

        textToDisplay = res;

    });

//
  }

  Widget custombutton(String btnval) {
    return Expanded(
      child: ElevatedButton(
        child: Text(btnval),
        onPressed: () {
          btnclicked(btnval);
          Text(
            btnval,
            style: TextStyle(fontSize: 25.0),
          );
        },
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  textToDisplay,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

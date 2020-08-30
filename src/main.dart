import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: new CalculatorPage(),
      home: CalculatorPage(title: 'Calculator'),

    );
  }
}



class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _CalculatorPageState createState() => new _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String result="0";
  double num1=0.0;
  double num2=0.0;
  String op="";
  String calc="0";

  calculator(text){
    if (text == "AC") {
      calc = "0";
      result="0";
      num1 = 0.0;
      num2 = 0.0;
      op = " ";
    }
    else if(text=="DEL"){
      calc=(int.parse(calc)~/10).toString();
    }
    else if (text == "+" || text == "-" || text == "÷" || text == "X" ||text=="%") {
      num1 = double.parse(result);
      op = text;
      calc="0";
    }
    else if (text == '.') {
      if (!calc.contains(".")) {
        calc += text;
      }
    }
    else if (text == "=") {
      if (op == "+") {
        num2 = double.parse(result);
        calc = (num1 + num2).toString();
      }
      if (op == "-") {
        num2 = double.parse(result);
        calc = (num1 - num2).toString();
      }


      if (op == "X") {
        num2 = double.parse(result);
        calc = (num1 * num2).toString();
      }
      if(op=="%"){
        calc=(num1/100.0).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      op="";
    }
    else {
      calc+=text;
    }

    setState(() {
      if(text == "+" || text == "-" || text == "÷" || text == "X" ||
          text=="%"){
        result=text;
      }
      else {
        result = double.parse(calc).toStringAsFixed(4);
      }
    });
  }
  Widget myButton(text){
    return Column(
      children : <Widget> [
        Expanded(
          child: RaisedButton(
            child:Text(text,style: TextStyle(fontSize: 13.2,
          fontWeight: FontWeight.bold, color: Colors.white,
          ),
          ),
          onPressed: ()=>{
            calculator(text)
        },
        color:Colors.grey,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.white)
        ),
            textColor: Colors.white,
            padding: EdgeInsets.all(5.0),
      ),
    ),
    ],
    );
  }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: new Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black12,
                  child:Text("$result")
                ),

              ),
              Flexible(
                flex: 5,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black26,

                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: new Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Flexible(flex: 1, child: myButton("AC")),
                            Flexible(flex: 1, child: myButton("DEL")),
                            Flexible(flex: 1, child: myButton("%")),
                            Flexible(flex: 2, child: myButton("÷"))


                            ],
                          ),
                        ),
                      ),

                      Flexible(
                        flex: 1,
                        child: new Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(flex: 1, child: myButton("7")),
                              Flexible(flex: 1, child: myButton("8")),
                              Flexible(flex: 1, child: myButton("9")),
                              Flexible(flex: 2, child: myButton("X"))
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: new Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(flex: 1, child: myButton("4")),
                              Flexible(flex: 1, child: myButton("5")),
                              Flexible(flex: 1, child: myButton("6")),
                              Flexible(flex: 2, child: myButton("-"))
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: new Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(flex: 1, child: myButton("1")),
                              Flexible(flex: 1, child: myButton("2")),
                              Flexible(flex: 1, child: myButton("3")),
                              Flexible(flex: 2, child: myButton("+"))
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: new Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(flex: 2, child: myButton("0")),
                              Flexible(flex: 1, child: myButton(".")),
                              Flexible(flex: 2, child: myButton("=")),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class myButton extends StatelessWidget {
  String text;

  myButton(this.text);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(6.0),
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(16.0)),
          color: Colors.white24),
      child: new Text(
        text,
        style: new TextStyle(color: Colors.white, fontSize: 3.0),
      ),
    );
  }
}
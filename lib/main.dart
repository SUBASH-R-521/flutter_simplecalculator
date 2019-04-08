import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output="0";
  String _output ="0";
  double _num1 =0.0;
  double _num2 =0.0;
  String _operand="";


  buttonPressed(String buttontext)
  {
    if(buttontext=="Clear"){
      _output ="0";
      _num1 =0.0;
      _num2 =0.0;
      _operand="";
    }
    else if(buttontext=="+"||buttontext=="-"||buttontext=="*"||buttontext=="/"){
      _num1 = double.parse(output);
      _operand = buttontext;
      _output ="";
    }
    else if(buttontext=="."){
      if(_output.contains(".")){
        print("alresdy it contains");
      }
      else{
        _output=_output+buttontext;
      }
    }
    else if(buttontext =="="){
        _num2=double.parse(output);
        if(_operand=="+"){
          _output=(_num1 + _num2).toString();
          print(buttontext);
        }
        if(_operand=="-"){
          _output=(_num1 - _num2).toString();
        }
        if(_operand=="*"){
          _output=(_num1 * _num2).toString();
        }
        if(_operand=="/"){
          _output=(_num1 / _num2).toString();
        }
        _num1=0.0;
        _num2=0.0;
        _operand="";
    }
    else{
      _output = _output + buttontext;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }
Widget buildButton(String buttontext){
  return new Expanded(
    child: new OutlineButton(
      padding: new EdgeInsets.all(20.0),
      child : new Text(buttontext,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),),
      onPressed:()=> {
        buttonPressed(buttontext),
      },
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:new Container(
        child: new Column(
          children: <Widget>[
            new Container(
                alignment:Alignment.centerRight,
                padding:new EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 12.0,
                ),
                child: new Text(
                  output,
                  style: new TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            new Expanded(
                 child: new Divider()
            ),
            new Column(
              children:[
                 new Row(
                   children:[
                     buildButton("7"),
                     buildButton("8"),
                     buildButton("9"),
                     buildButton("/"),
                   ]
                 ),
                 new Row(
                     children:[
                       buildButton("4"),
                       buildButton("5"),
                       buildButton("6"),
                       buildButton("*"),
                     ]
                 ),
                 new Row(
                     children:[
                       buildButton("1"),
                       buildButton("2"),
                       buildButton("3"),
                       buildButton("-"),
                     ]
                 ),
                 new Row(
                     children:[
                       buildButton("."),
                       buildButton("0"),
                       buildButton("00"),
                       buildButton("+"),
                     ]
                 ),
                 new Row(
                     children:[
                       buildButton("Clear"),
                       buildButton("="),
                     ]
                 ),
              ],
            )
          ],),
        ),
    );
  }
}

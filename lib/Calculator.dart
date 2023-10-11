import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _myHomePageState createState() => new _myHomePageState();
}

class _myHomePageState extends State<homePage> {
  double total = 0, n1 = 0, n2 = 0;
  double buttonHigh = 40;
  double buttonWidth = 100;

  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: Text("Basic Operations"),
        centerTitle: true,
        backgroundColor: Colors.redAccent[400],
      ),
      body: new Container(
        padding: EdgeInsets.all(40.0),
        child: new Column(
          children: <Widget>[
            new Container(
              height: 100,
            ),
            new Text(
              "Output: $total ",
              style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter first number"),
              controller: t1,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter second number"),
              controller: t2,
            ),
            new Padding(padding: EdgeInsets.only(top: 50.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                  height: buttonHigh,
                  width: buttonWidth,
                  child: new MaterialButton(
                    //onPressed: (){print("Suma");},
                    onPressed: _doAddition,
                    child: Icon(Icons.add),
                    color: Colors.greenAccent[200],
                  ),
                ),
                new Container(
                  height: buttonHigh,
                  width: buttonWidth,
                  child: new MaterialButton(
                    onPressed: () {
                      print("Resta");
                    },
                    child: Icon(Icons.minimize),
                    color: Colors.redAccent[200],
                  ),
                )
              ],
            ),
            new Padding(padding: EdgeInsets.only(top: 35.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                  height: buttonHigh,
                  width: buttonWidth,
                  child: new MaterialButton(
                    onPressed: () {
                      print("Multiplica");
                    },
                    child: new Text("X"),
                    color: Colors.blueAccent[200],
                  ),
                ),
                new Container(
                  height: buttonHigh,
                  width: buttonWidth,
                  child: new MaterialButton(
                    //onPressed: (){print("Divide");},
                    onPressed: () {
                      if (double.tryParse(t2.text) != 0) {
                        _doDivide();
                        //_doDivide;
                      } else {
                        _showSnackBar(context, "You can´t divide between zero");
                      }
                    },
                    child: new Text("/"),
                    color: Colors.amberAccent[100],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _doAddition() {
    setState(() {
      n1 = double.tryParse(t1.text)!;
      n2 = double.tryParse(t2.text)!;
      total = n1 + n2;
      t1.text = "";
      t2.text = "";
    });
  }

  _doDivide() {
    setState(() {
      n1 = double.tryParse(t1.text)!;
      n2 = double.tryParse(t2.text)!;
      total = n1 / n2;
      t1.text = "";
      t2.text = "";
    });
  }

  //_snackBar(context){

  _showSnackBar(BuildContext context, String texto) {
    final snackBar = SnackBar(content: new Text(texto));
   // _scaffoldKey.currentState?.showSnackBar(snackBar);
  }
}

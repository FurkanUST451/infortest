import 'package:flutter/material.dart';
import 'package:infotest/constants.dart';
import 'Text_List.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: MainPage(),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  List <Widget> choses=[];
  Texts Bank_1 = Texts();
  void buttonfunction (bool type){
    if(Bank_1.isover()==true){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Well Done"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new ElevatedButton(
                child: new Text("Restart"),
                onPressed: () {
                  setState(() {
                    Bank_1.restart();
                    choses= [];
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    else {
      setState(() {
        Bank_1.answergetter() == type
            ? choses.add(wrongIcon)
            : choses.add(correctIcon);
        Bank_1.nextques();
      });
    }
    ;}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  Bank_1.textgetter(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,10,10,10),
          child: Wrap(
            spacing: 3,
            runSpacing: 3,
            children: choses,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,10,10,50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, foregroundColor: Colors.white,minimumSize:Size(50, 60)),
                  child: Icon(Icons.thumb_down),
                  onPressed: (){buttonfunction(true);},
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,10,10,50),
                child: ButtonTheme(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, foregroundColor: Colors.white,minimumSize: Size(50, 60)),
                    child: Icon(Icons.thumb_up),
                    onPressed: (){
                      buttonfunction(false);},
                  ),
                ),
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }
}

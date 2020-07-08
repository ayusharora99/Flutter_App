// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  _MyHomePageState() {
    //init Alan with sample project id
    AlanVoice.addButton(
        "e8f2d2793341369a9257b6d81473ff382e956eca572e1d8b807a3e2338fdd0dc/stage");
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = new TextEditingController();

    void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = controller.text;
    print("initial text is " + textToSend);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(text: textToSend,),
        ));
  }
    String symptoms = '';
    return new Scaffold(
      appBar: new AppBar(title: new Text("Alan Medical Chatbot")),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                  hintText: "Hi there! What are your symptoms?"
                ),
                controller: controller
              ),
              new Text(symptoms),
              RaisedButton(
                onPressed: (){
                  _sendDataToSecondScreen(context);
                },
                child: Text("Find Doctors"),
                color: Colors.lightBlue
                )
            ],
          )
        )
      )
        
    );
  }
}


class SecondScreen extends StatelessWidget {
  final String text;
  List <String> doctorNames = ["Dr. Turing","Dr. Andy", "Dr. Bob", "Dr. Chuck", "Dr. Danny", "Dr. Ethan", "Dr. Frank", "Dr. George", "Dr. Harry", "Dr. Ian", "Dr. John", "Dr. Karl", "Dr. Leo", "Dr. Marty", "Dr. Nicole", "Dr. Oscar", "Dr. Patrick", "Dr. Quinn", "Dr. Rick", "Dr. Steven", "Dr. Todd", "Dr. Uriel", "Dr. Vanessa", "Dr. William", "Dr. Xavier", "Dr. Yasmine", "Dr. Zeus"];
  SecondScreen({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of Doctors')),
      body: getListView(text, context, doctorNames)
    );
  }

  Widget getListView(String text, BuildContext context, List doctorNames){
    var listView = ListView.builder(
      itemCount: doctorNames.length,
      itemBuilder: (context,index){
        return ListTile(
          leading: Icon(Icons.local_hospital),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text(doctorNames[index]) ,
            subtitle: Text("For these symptoms: " + text),
            selected: true,
            onTap: () {
              print(doctorNames[index]);
              goToDoctorScreen(context,doctorNames[index],text);
            }
          );
      },
    );
    
    return listView;
  }

   void goToDoctorScreen(BuildContext context, String docName, String symptoms) {
    String textToSend = symptoms;
    String docToSend = docName;

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DoctorScreen(text: textToSend, docName: docToSend ),
        ));
  }
}




class DoctorScreen extends StatelessWidget{
  final String text;
  final String docName;
  DoctorScreen({Key key, @required this.text, @required this.docName}) : super(key: key);
  
  Widget build(BuildContext context) {
    print("Doctor Screen: " + text);
    return Scaffold(
      appBar: AppBar(title: Text(docName))
    );
  }

}
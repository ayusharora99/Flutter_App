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

  // receive data from the FirstScreen as a parameter
  SecondScreen({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of Doctors')),
      body: getListView(text)
    );
  }

  Widget getListView(String text){
    var listView = ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.local_hospital),
          title: Text("Dr. Turing ") ,
          subtitle: Text("For these symptoms: " + text),
          selected: true
          // onTap: 
        ),
        ListTile(
          leading: Icon(Icons.local_hospital),
          title: Text("Dr. Turing ") ,
          subtitle: Text("For these symptoms: " + text),
          selected: true
        ),
        ListTile(
          leading: Icon(Icons.local_hospital),
          title: Text("Dr. Turing ") ,
          subtitle: Text("For these symptoms: " + text),
          selected: true
        ),
        ListTile(
          leading: Icon(Icons.local_hospital),
          title: Text("Dr. Turing ") ,
          subtitle: Text("For these symptoms: " + text),
          selected: true
        ),
        ListTile(
          leading: Icon(Icons.local_hospital),
          title: Text("Dr. Turing ") ,
          subtitle: Text("For these symptoms: " + text),
          selected: true
        ),
        ListTile(
          leading: Icon(Icons.local_hospital),
          title: Text("Dr. Turing ") ,
          subtitle: Text("For these symptoms: " + text),
          selected: true
        ),
        ListTile(
          leading: Icon(Icons.local_hospital),
          title: Text("Dr. Turing ") ,
          subtitle: Text("For these symptoms: " + text),
          selected: true
        ),
        ListTile(
          leading: Icon(Icons.local_hospital),
          title: Text("Dr. Turing ") ,
          subtitle: Text("For these symptoms: " + text),
          selected: true
        ),
        ListTile(
          leading: Icon(Icons.local_hospital),
          title: Text("Dr. Turing ") ,
          subtitle: Text("For these symptoms: " + text),
          selected: true
        ),
        ListTile(
          leading: Icon(Icons.local_hospital),
          title: Text("Dr. Turing ") ,
          subtitle: Text("For these symptoms: " + text),
          selected: true
        ),
        ListTile(
          leading: Icon(Icons.local_hospital),
          title: Text("Dr. Turing ") ,
          subtitle: Text("For these symptoms: " + text),
          selected: true
        ),
        ListTile(
          leading: Icon(Icons.local_hospital),
          title: Text("Dr. Turing ") ,
          subtitle: Text("For these symptoms: " + text),
          selected: true
        ),
        ListTile(
          leading: Icon(Icons.local_hospital),
          title: Text("Dr. Turing ") ,
          subtitle: Text("For these symptoms: " + text),
          selected: true
        ),
      
      ],
    );
    return listView;
  }
}
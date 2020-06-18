import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alan Basic Example',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Alan Basic Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  _MyHomePageState() {
    //init Alan with sample project id
    AlanVoice.addButton(
        "e8f2d2793341369a9257b6d81473ff382e956eca572e1d8b807a3e2338fdd0dc/prod");
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = new TextEditingController();

    String symptoms = '';
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
                onSubmitted: (String str){ // str will be fed to Alan 
                  setState((){
                    symptoms = "Symptoms: " + str;
                    controller.text = '';
                  });
                },
                controller: controller
              ),
              new Text(symptoms),
              RaisedButton(
                onPressed: (){},
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

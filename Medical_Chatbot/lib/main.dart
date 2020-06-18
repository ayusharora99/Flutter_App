import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Alan Medical Chatbot"),
//         ),
//         body: Text('This is my default text!'),
//       ),
//     );
//   }
// }

void main(){
  runApp(new MaterialApp(
    home: new MyTextInput()
  ));
}




class MyTextInput extends StatefulWidget{
  @override
  MyTextInputState createState() => new MyTextInputState();
}

class MyTextInputState extends State<MyTextInput>{

  final TextEditingController controller = new TextEditingController();

  String symptoms = '';

  // @override
  // void initState(){
  //   super.initState();
  //   AlanVoice.initButton(
  //       "e8f2d2793341369a9257b6d81473ff382e956eca572e1d8b807a3e2338fdd0dc/stage",
  //       server: 'wss://tutor.alan.app',
  //       buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);
    
  // }
  @override
  Widget build(BuildContext context){

    return new Scaffold(
      appBar: new AppBar(title: new Text("Alan Medical Chatbot")),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
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
              new Text(symptoms)
            ],
          )
        )
      )
        
    );
  }

    

  
}

// void _initAlanButton() async {
// if (_alanInited) {
//   return;
// }
// //init Alan with sample project id
// AlanVoice.addButton(
//     "8e0b083e795c924d64635bba9c3571f42e956eca572e1d8b807a3e2338fdd0dc/stage",
//     buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

// setState(() {
//   _alanInited = true;
// });
// }

      

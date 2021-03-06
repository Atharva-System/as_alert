import 'package:flutter/material.dart';
import 'package:asalert/asalert.dart';

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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            FlatButton(
              highlightColor: Colors.transparent,
              child: Text(
                "Click me",
              ),
              onPressed: () {
                showAlertWithOkayAction(context, "ASAlert", "Hey.... Welcome ", closeDialogue, btnTitle: "Dismiss");
              },
            ),
            FlatButton(
              highlightColor: Colors.transparent,
              child: Text(
                "Logout",
              ),
              onPressed: () {
                showOkayAndCloseAlertWithOkayAction(context, onPressedOk, "Logout", "Are you sure you want to logout the app?");
              },
            )
          ],
        ),
      ),
    );
  }

  onPressedOk() {
    closeDialogue();
    showAlertWithOkayAction(context, "Alert", "You have successfully logged out.", closeDialogue);
  }

  closeDialogue() {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }
}


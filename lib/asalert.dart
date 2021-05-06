import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

String TITLEOKAY = "Okay";
String TITLECLOSE = "Close";

//ALERT WITH SINGLE BUTTON
void showOkayAndCloseAlertWithOkayAction(
    BuildContext context, VoidCallback onPressedOk, String title, String msg,
    {String okBtnTitle, String cancelBtnTitle}) {
  if (Platform.isIOS) {
    showDialog(
        context: context,
        child: CupertinoAlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: <Widget>[
            CupertinoDialogAction(
                textStyle: TextStyle(color: Colors.red),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                },
                child: Text(cancelBtnTitle ?? TITLECLOSE)),
            CupertinoDialogAction(
                textStyle: TextStyle(color: Colors.blue),
                isDefaultAction: true,
                onPressed: onPressedOk,
                child: Text(okBtnTitle ?? TITLEOKAY)),
          ],
        ));
  } else {
    // set up the buttons
    Widget cancelButton = FlatButton(
      highlightColor: Colors.transparent,
      child: Text(
        cancelBtnTitle ?? TITLECLOSE,
        style: commonTextStyleForAndroidDialog(),
      ),
      onPressed: () {
        //DISMISS ALTER DIALOG
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = FlatButton(
      highlightColor: Colors.transparent,
      child: Text(
        okBtnTitle ?? TITLEOKAY,
        style: commonTextStyleForAndroidDialog(),
      ),
      onPressed: onPressedOk,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
        style: commonTextStyleForAndroidDialog(),
      ),
      content: Text(
        msg,
        style: commonTextStyleForAndroidDialog(),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

//ALERT WITH TWO BUTTON
void showAlertWithOkayAction(
    BuildContext context, String title, String msg, VoidCallback onPressedOk,
    {String btnTitle}) {
  if (Platform.isIOS) {
    showDialog(
        context: context,
        child: CupertinoAlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: <Widget>[
            CupertinoDialogAction(
                textStyle: TextStyle(color: Colors.red),
                isDefaultAction: true,
                onPressed: onPressedOk,
                child: Text(btnTitle ?? TITLECLOSE)),
          ],
        ));
  } else {
    Widget continueButton = FlatButton(
      highlightColor: Colors.transparent,
      child: Text(
        btnTitle ?? TITLECLOSE,
        style: commonTextStyleForAndroidDialog(),
      ),
      onPressed: onPressedOk,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        title ,
        style:  commonTextStyleForAndroidDialog(),
      ),
      content: Text(
        msg,
        style:  commonTextStyleForAndroidDialog(),
      ),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

commonTextStyleForAndroidDialog({Colors color}) {
  return TextStyle(color: color ?? Colors.black, fontFamily: 'Roboto');
}

# asalert

A new Flutter package to show alert based on platform. It contains two type of alert dialogue, One contains Alert with single actionable button and second alert dialogue contains two actionable button.

## Getting Started
```

//OKAY ACTION FUNCTION TO PASS AS REQUIRED ARGUMENT
 onPressedOk() {
    closeDialogue();
    showAlertWithOkayAction(
        context,                                //Required BuildContext
        "Alert",                                //Required Alert Title
        "You have successfully logged out.",    //Required Alert Message
        closeDialogue                           //Required action when button tapped
        btnTitle: "Dismiss"                     //Optional btn title
     );
 }

//CLOSE ACTION FUNCTION TO DISMISS ALERT DIALOGIE AND PASS AS REQUIRED ARGUMENT
 closeDialogue() {
    Navigator.of(context, rootNavigator: true).pop('dialog');
 }

    //CALLING ALERT WITH SINGLE BUTTON ON FlatButton BUTTON CLICK
 FlatButton(
   highlightColor: Colors.transparent,
   child: Text(
     "Click me",
   ),
   onPressed: () {
     showAlertWithOkayAction(context, "ASAlert", "Hey.... Welcome ", closeDialogue);
   },
 ),

    //CALLING ALERT WITH TWO BUTTON ON FlatButton BUTTON CLICK
 FlatButton(
   highlightColor: Colors.transparent,
   child: Text(
     "Logout",
   ),
   onPressed: () {
     showOkayAndCloseAlertWithOkayAction(context, onPressedOk, "Logout", "Are you sure you want to logout the app?");
   },
 )


```

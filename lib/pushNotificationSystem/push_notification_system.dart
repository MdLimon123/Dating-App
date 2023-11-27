import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class PushNotificationSystem{

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // notification arrived/ received

Future whenNotificationReceived(BuildContext context)async{


  //1. Terminated
  // When the app is completely closed and opened directly from the push notification

  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? remoteMessage){
    if(remoteMessage !=null){

      // open app and show notification data

      openAppAndShowNotificationData(

        remoteMessage.data["userID"],
        remoteMessage.data["senderID"],
        context,


      );
    }
  });


  //2. Foreground
  // When the app is open and it receives a push notification

  FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage) {

    if(remoteMessage !=null) {
      // open app and show notification data

      openAppAndShowNotificationData(

        remoteMessage.data["userID"],
        remoteMessage.data["senderID"],
        context,


      );
    }
  });


  //3. Background
  // When the app is in the background and opened directly from the push notification

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage) {

    if(remoteMessage !=null) {
      // open app and show notification data

      openAppAndShowNotificationData(

        remoteMessage.data["userID"],
        remoteMessage.data["senderID"],
        context,


      );
    }

  });


}

  openAppAndShowNotificationData(receiverID, senderID, context)async{



  }


}
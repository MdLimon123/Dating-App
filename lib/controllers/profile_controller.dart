import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:dating_app/models/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final Rx<List<Person>> userProfileList = Rx<List<Person>>([]);

  List<Person> get allUserProfileList => userProfileList.value;

  getResults(){

    onInit();

  }

  @override
  void onInit() {
    super.onInit();

    if(chosenGender == null || chosenCountry == null || chosenAge == null){

      userProfileList.bindStream(FirebaseFirestore.instance
          .collection('users')
          .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .map((QuerySnapshot queryDataSnapshot) {
        List<Person> profilesList = [];

        for (var eachFor in queryDataSnapshot.docs) {
          profilesList.add(Person.fromDataSnapshot(eachFor));
        }
        return profilesList;
      }));

    }else{

      userProfileList.bindStream(FirebaseFirestore.instance
          .collection('users')
          .where('gender', isEqualTo: chosenGender.toString().toLowerCase())
          .where('country', isEqualTo: chosenCountry.toString())
          .where('age', isGreaterThanOrEqualTo: int.parse(chosenAge.toString()))
          .snapshots()
          .map((QuerySnapshot queryDataSnapshot) {
        List<Person> profilesList = [];

        for (var eachFor in queryDataSnapshot.docs) {
          profilesList.add(Person.fromDataSnapshot(eachFor));
        }
        return profilesList;
      }));

    }


  }

// favorite sent and favorite received method
  favoriteSentAndFavoriteReceived(String toUserID, String senderName) async {
    var doucument = await FirebaseFirestore.instance
        .collection('users')
        .doc(toUserID)
        .collection('favoriteReceived')
        .doc(currentUserID)
        .get();

    // remove the favorite from database
    if (doucument.exists) {
      // remove currentUserID from the favorite Received list of the profile person [toUserID]

      await FirebaseFirestore.instance
          .collection('users')
          .doc(toUserID)
          .collection('favoriteReceived')
          .doc(currentUserID)
          .delete();

      // remove profile person [toUserID] from the favorite Received list of currentUserID
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserID)
          .collection('favoriteSent')
          .doc(toUserID)
          .delete();
    } else {
      // mark add favorite from database

      // add  CurrentUserID to the favoriteReceived list of that profile person [toUserID]

      await FirebaseFirestore.instance
          .collection('users')
          .doc(toUserID)
          .collection('favoriteReceived')
          .doc(currentUserID)
          .set({});

      // add profile person [toUserID] to the favorite sent list of currentUserID
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserID)
          .collection('favoriteSent')
          .doc(toUserID)
          .set({});

      // send notification
      
      sendNotificationToUser(toUserID, 'Favorite', senderName);
      
    }

    update();
  }

// like sent and like received method
  likeSentAndFavoriteReceived(String toUserID, String senderName) async {
    var doucument = await FirebaseFirestore.instance
        .collection('users')
        .doc(toUserID)
        .collection('likeReceived')
        .doc(currentUserID)
        .get();

    // remove the like from database
    if (doucument.exists) {
      // remove currentUserID from the like Received list of the profile person [toUserID]

      await FirebaseFirestore.instance
          .collection('users')
          .doc(toUserID)
          .collection('likeReceived')
          .doc(currentUserID)
          .delete();

      // remove profile person [toUserID] from the like sent list of currentUserID
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserID)
          .collection('likeSent')
          .doc(toUserID)
          .delete();
    } else {
      // add-sent like from database

      // add  CurrentUserID to the likeReceived list of that profile person [toUserID]

      await FirebaseFirestore.instance
          .collection('users')
          .doc(toUserID)
          .collection('likeReceived')
          .doc(currentUserID)
          .set({});

      // add profile person [toUserID] to the likeSent  list of currentUserID
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserID)
          .collection('likeSent')
          .doc(toUserID)
          .set({});

      // send notification

      sendNotificationToUser(toUserID, 'Like', senderName);
    }

    update();
  }

// like sent and like received method
  viewSentAndViewReceived(String toUserID, String senderName) async {
    var doucument = await FirebaseFirestore.instance
        .collection('users')
        .doc(toUserID)
        .collection('viewReceived')
        .doc(currentUserID)
        .get();

    if (doucument.exists) {
      print("Already view in list");
    } else {
      // add-new view in  database

      // add  CurrentUserID to the viewReceived list of that profile person [toUserID]

      await FirebaseFirestore.instance
          .collection('users')
          .doc(toUserID)
          .collection('viewReceived')
          .doc(currentUserID)
          .set({});

      // add profile person [toUserID] to the viewSent  list of currentUserID
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserID)
          .collection('viewSent')
          .doc(toUserID)
          .set({});

      // send notification
      sendNotificationToUser(toUserID, 'View', senderName);
    }

    update();
  }

  sendNotificationToUser(receiverID, featureType, senderName)async{

    String userDeviceToken = "";

    await FirebaseFirestore.instance
        .collection('users')
        .doc(receiverID)
        .get()
        .then((snapshot){

          if(snapshot.data()!['userDeviceToken'] !=null){

            userDeviceToken = snapshot.data()!['userDeviceToken'].toString();
          }
    });

    notificationFormat(
        userDeviceToken,
        receiverID,
        featureType,
        senderName

    );
  }

  notificationFormat(  userDeviceToken, receiverID, featureType, senderName){

    Map<String, String> headerNotification ={
      "Content-Type":"application/json",
       "Authorization":fcmServerToken
    };

    Map bodyNotification =
        {
          "body": "you have received a new $featureType from $senderName. Click to see.",
          "title": "New $featureType"
        };

    Map dataMap =
        {
          "click_action": "FLUTTER_NOTIFICATION_CLICK",
          "id": "1",
          "status": "done",
          "userID": receiverID,
          "senderID": currentUserID
        };

    Map notificationOfficialFormat =
        {
          "notification":bodyNotification,
          "data": dataMap,
          "priority": "high",
          "to": userDeviceToken
        };

    http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
    headers: headerNotification,
    body: jsonEncode(notificationOfficialFormat));


  }

}

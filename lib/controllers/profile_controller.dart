import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:dating_app/models/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final Rx<List<Person>> userProfileList = Rx<List<Person>>([]);

  List<Person> get allUserProfileList => userProfileList.value;

  @override
  void onInit() {
    super.onInit();

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
  }

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

      // sent notification
    }

    update();
  }

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

      // sent notification
    }

    update();
  }
}

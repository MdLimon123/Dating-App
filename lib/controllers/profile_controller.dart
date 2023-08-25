import 'package:cloud_firestore/cloud_firestore.dart';
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
}

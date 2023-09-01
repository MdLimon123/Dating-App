import 'package:dating_app/tabsScreen/favorite_sent_favorite_received_screen.dart';
import 'package:dating_app/tabsScreen/like_sent_like_received_screen.dart';
import 'package:dating_app/tabsScreen/swipping_screen.dart';
import 'package:dating_app/tabsScreen/user_details_screen.dart';
import 'package:dating_app/tabsScreen/view_sent_view_received_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  var currentIndex = 0.obs;

  @override
  void onInit() {
    currentIndex.value = 0;
    super.onInit();
  }

  final pages = [
    SwippingScreen(),
    ViewSentViewReceivedScreen(),
    FavoriteSentFavoriteReceivedScreen(),
    LikeSentLikeReceivedScreen(),
    UserDetailsScreen(
      userID: FirebaseAuth.instance.currentUser!.uid,
    )
  ];

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}

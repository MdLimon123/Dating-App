
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/nav_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   final _navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: Obx(()=>
           BottomNavigationBar(
            onTap: (index){

              _navController.onItemTapped(index);

            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.purpleAccent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            currentIndex: _navController.currentIndex.value,
            items: [
              // SwippingScreen
              BottomNavigationBarItem(icon: Icon(Icons.home,size: 30.sp,
              ),
              label: ""),
              // viewSentViewReceivedScreen
              BottomNavigationBarItem(icon: Icon(Icons.remove_red_eye,size: 30.sp,
              ),
                  label: ""),
              //favoriteSentFavoriteReceived icon button
              BottomNavigationBarItem(icon: Icon(Icons.star,size: 30.sp,
              ),
                  label: ""),
              //likeSentLikeReceived icon button
              BottomNavigationBarItem(icon: Icon(Icons.favorite,size: 30.sp,
              ),
                  label: ""),
              //userDetailsScreen icon button
              BottomNavigationBarItem(icon: Icon(Icons.home,size: 30.sp,
              ),
                  label: ""),
            ],


          ),
        ),
        body: Obx(()=> _navController.pages.elementAt(_navController.currentIndex.value))

      ),
    );
  }
}

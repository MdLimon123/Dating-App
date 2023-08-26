import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class SwippingScreen extends StatefulWidget {

  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  final _profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>
         PageView.builder(
          itemCount: _profileController.allUserProfileList.length,
            itemBuilder:(context, index){
          final eachProfile = _profileController.allUserProfileList[index];

          return DecoratedBox(decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(eachProfile.imageProfile.toString()),
              fit: BoxFit.cover
            ),

          ));
        }),
      )
    );
  }
}

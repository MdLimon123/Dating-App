import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:dating_app/tabsScreen/user_details_screen.dart';
import 'package:dating_app/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {

  final _profileController = Get.put(ProfileController());
  String senderName = "";


  applyFilter(){

    showDialog(context: context,
        builder: (BuildContext context){

      return StatefulBuilder(
          builder:(BuildContext context, StateSetter setState){
            return AlertDialog(
              title:const Text('Matching Filter'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const Text('I am looking for a:'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DropdownButton<String>(
                      hint: const Text('Select gender'),
                      value: chosenGender,
                      underline: Container(),
                      items: [
                        'Male',
                        'Female',
                        'Others'
                      ].map((value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: const TextStyle(fontWeight: FontWeight.w500)),
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          chosenGender = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),

                  const Text('who lives in:'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DropdownButton<String>(
                      hint: const Text('Select country'),
                      value: chosenCountry,
                      underline: Container(),
                      items: [
                        'Spain',
                        'France',
                        'Germany',
                        'United Kingdom',
                        'Canada',
                        'USA'
                      ].map((value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: const TextStyle(fontWeight: FontWeight.w500)),
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          chosenCountry = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),

                  const Text("who's age is equal to or above:"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DropdownButton<String>(
                      hint: const Text('Select age'),
                      value: chosenAge,
                      underline: Container(),
                      items: [
                        '18',
                        '20',
                        '25',
                        '30',
                        '35',
                        '40',
                        '45',
                        '50',
                        '55'
                      ].map((value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: const TextStyle(fontWeight: FontWeight.w500)),
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          chosenAge = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),



                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: (){
                      Get.back();
                      _profileController.getResults();
                    },
                    child: const Text('Done'))
              ],
            );
          }
      );

        });
  }

  readCurrentUserData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .get()
        .then((dataSnapshot) {
      setState(() {
        senderName = dataSnapshot.data()!['name'].toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();

    readCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => PageView.builder(
          itemCount: _profileController.allUserProfileList.length,
          itemBuilder: (context, index) {
            final eachProfile = _profileController.allUserProfileList[index];

            return DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(eachProfile.imageProfile.toString()),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  children: [
                    // filter icon button
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.w),
                        child: IconButton(
                            onPressed: () {

                              applyFilter();
                            },
                            icon: Icon(
                              Icons.filter_list,
                              size: 30.sp,
                            )),
                      ),
                    ),

                    const Spacer(),
                    // user data
                    InkWell(
                      onTap: () {
                        // send user to profile person userDetailsScreen

                        _profileController.viewSentAndViewReceived(
                            eachProfile.uid.toString(), senderName);
                        Get.to(UserDetailsScreen(
                          userID: eachProfile.uid.toString(),
                        ));
                      },
                      child: Column(
                        children: [
                          // name
                          Text(
                            eachProfile.name.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 4),
                          ),

                          // age and city
                          Text(
                            "${eachProfile.age} ● ${eachProfile.city}  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                letterSpacing: 4),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),

                          // profession and religion
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.r))),
                                  child: Text(
                                    eachProfile.profession.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                  )),
                              SizedBox(
                                width: 6.w,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.r))),
                                  child: Text(
                                    eachProfile.religion.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                  ))
                            ],
                          ),

                          // country and ethnicity
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.r))),
                                  child: Text(
                                    eachProfile.country.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                  )),
                              SizedBox(
                                width: 6.w,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.r))),
                                  child: Text(
                                    eachProfile.ethnicity.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),

                    // image buttons - favorites- chat - likes

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // favorite
                          GestureDetector(
                            onTap: () {
                              _profileController
                                  .favoriteSentAndFavoriteReceived(
                                      eachProfile.uid.toString(), senderName);
                            },
                            child: Image.asset(
                              AppImage.favorite,
                              width: 60.w,
                            ),
                          ),

                          // chat
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              AppImage.chat,
                              width: 60.w,
                            ),
                          ),

                          // like
                          GestureDetector(
                            onTap: () {
                              _profileController.likeSentAndFavoriteReceived(
                                  eachProfile.uid.toString(), senderName);
                            },
                            child: Image.asset(
                              AppImage.like,
                              width: 60.w,
                            ),
                          ),
                        ])
                  ],
                ),
              ),
            );
          }),
    ));
  }
}

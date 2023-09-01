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
                            onPressed: () {},
                            icon: Icon(
                              Icons.filter_list,
                              size: 30.sp,
                            )),
                      ),
                    ),

                    Spacer(),
                    // user data
                    InkWell(
                      onTap: () {},
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

                          // profiession and religion
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
                            onTap: () {},
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
                            onTap: () {},
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

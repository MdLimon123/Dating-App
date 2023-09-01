import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetailsScreen extends StatefulWidget {
  final String? userID;

  UserDetailsScreen({super.key, this.userID});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  String imageProfile = '';
  String email = '';
  String password = '';
  String name = '';
  String age = '';
  String phoneNo = '';
  String city = '';
  String country = '';
  String profileHeading = '';
  String lookingForInaPartner = '';
  String publishedDateTime = '';

  //Appearance
  String height = '';
  String weight = '';
  String bodyType = '';

  // Life style

  String drink = '';
  String smoke = '';
  String martialStatus = '';
  String haveChildren = '';
  String noOfChildren = '';
  String profession = '';
  String employmentStatus = '';
  String income = '';
  String livingSituation = '';
  String willingToRelocate = '';
  String relationshipYouAreLookingFor = '';

  // Background - Cultural Values

  String nationality = '';
  String education = '';
  String languageSpoken = '';
  String religion = '';
  String ethnicity = '';

  // slider images

  String urlImage1 =
      "https://firebasestorage.googleapis.com/v0/b/dating-app-6959f.appspot.com/o/Place%20Holder%2Fprofile.png?alt=media&token=66982cb5-d412-4788-a37b-196424e6aa0c";
  String urlImage2 =
      "https://firebasestorage.googleapis.com/v0/b/dating-app-6959f.appspot.com/o/Place%20Holder%2Fprofile.png?alt=media&token=66982cb5-d412-4788-a37b-196424e6aa0c";
  String urlImage3 =
      "https://firebasestorage.googleapis.com/v0/b/dating-app-6959f.appspot.com/o/Place%20Holder%2Fprofile.png?alt=media&token=66982cb5-d412-4788-a37b-196424e6aa0c";
  String urlImage4 =
      "https://firebasestorage.googleapis.com/v0/b/dating-app-6959f.appspot.com/o/Place%20Holder%2Fprofile.png?alt=media&token=66982cb5-d412-4788-a37b-196424e6aa0c";
  String urlImage5 =
      "https://firebasestorage.googleapis.com/v0/b/dating-app-6959f.appspot.com/o/Place%20Holder%2Fprofile.png?alt=media&token=66982cb5-d412-4788-a37b-196424e6aa0c";

  retrieveUserInfo() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userID)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        if (snapshot.data()!['image1'] != null) {
          setState(() {
            urlImage1 = snapshot.data()!['urlImage1'];
            urlImage2 = snapshot.data()!['urlImage2'];
            urlImage3 = snapshot.data()!['urlImage3'];
            urlImage4 = snapshot.data()!['urlImage4'];
            urlImage5 = snapshot.data()!['urlImage5'];
          });
        }
        setState(() {
          // personal info
          name = snapshot.data()!['name'];
          age = snapshot.data()!['age'].toString();
          phoneNo = snapshot.data()!['phoneNo'];
          city = snapshot.data()!['city'];
          country = snapshot.data()!['country'];
          profileHeading = snapshot.data()!['profileHeading'];
          lookingForInaPartner = snapshot.data()!['lookingForInaPartner'];

          // Appearance
          height = snapshot.data()!['height'];
          weight = snapshot.data()!['weight'];
          bodyType = snapshot.data()!['bodyType'];

          // Life style

          drink = snapshot.data()!['drink'];
          smoke = snapshot.data()!['smoke'];
          martialStatus = snapshot.data()!['martialStatus'];
          haveChildren = snapshot.data()!['haveChildren'];
          noOfChildren = snapshot.data()!['noOfChildren'];
          profession = snapshot.data()!['profession'];
          employmentStatus = snapshot.data()!['employmentStatus'];
          income = snapshot.data()!['income'];
          livingSituation = snapshot.data()!['livingSituation'];
          willingToRelocate = snapshot.data()!['willingToRelocate'];
          relationshipYouAreLookingFor =
              snapshot.data()!['relationshipYouAreLookingFor'];

          // Background - Cultural Values
          nationality = snapshot.data()!['nationality'];
          education = snapshot.data()!['education'];
          languageSpoken = snapshot.data()!['languageSpoken'];
          religion = snapshot.data()!['religion'];
          ethnicity = snapshot.data()!['ethnicity'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    retrieveUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'User Profile',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(
                  Icons.logout,
                  size: 30.sp,
                ))
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(30.w),
            child: Column(
              children: [
                // image slider
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Carousel(
                      indicatorBarColor: Colors.black.withOpacity(0.3),
                      autoScrollDuration: const Duration(seconds: 2),
                      animationPageDuration: const Duration(milliseconds: 500),
                      activateIndicatorColor: Colors.black,
                      animationPageCurve: Curves.easeIn,
                      indicatorBarHeight: 30,
                      indicatorHeight: 10,
                      indicatorWidth: 10,
                      unActivatedIndicatorColor: Colors.grey,
                      stopAtEnd: false,
                      autoScroll: true,
                      items: [
                        Image.network(
                          urlImage1,
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          urlImage2,
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          urlImage3,
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          urlImage4,
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          urlImage5,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                ),

                // personal info title
                SizedBox(
                  height: 30.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Personal Info:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),

                // personal info table data
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(20.w),
                  child: Table(
                    children: [
                      // name
                      TableRow(children: [
                        Text(
                          "Name: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          name,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // age
                      TableRow(children: [
                        Text(
                          "Age: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          age,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // phone No
                      TableRow(children: [
                        Text(
                          "Phone Number: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          phoneNo,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // city
                      TableRow(children: [
                        Text(
                          "City: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          city,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // country
                      TableRow(children: [
                        Text(
                          "Country: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          country,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // seeking
                      TableRow(children: [
                        Text(
                          "Seeking: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          lookingForInaPartner,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),
                    ],
                  ),
                ),

                //Appearance title
                SizedBox(
                  height: 30.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Appearance: ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),

                // Appearance info table data

                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(20.w),
                  child: Table(
                    children: [
                      // height
                      TableRow(children: [
                        Text(
                          "Height: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          height,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // weight
                      TableRow(children: [
                        Text(
                          "Weight: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          weight,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // body type
                      TableRow(children: [
                        Text(
                          "Body Type: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          bodyType,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),
                    ],
                  ),
                ),

                // Life style title
                SizedBox(
                  height: 30.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Life Style: ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),

                // life style info table data

                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(20.w),
                  child: Table(
                    children: [
                      // drink
                      TableRow(children: [
                        Text(
                          "Drink: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          drink,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // smoke
                      TableRow(children: [
                        Text(
                          "Smoke: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          smoke,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // martialStatus
                      TableRow(children: [
                        Text(
                          "Marital Status: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          martialStatus,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table

                      const TableRow(children: [Text(""), Text("")]),

                      TableRow(children: [
                        // haveChildren
                        Text(
                          "Have an Children: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          haveChildren,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // noOfChildren
                      TableRow(children: [
                        Text(
                          "No Of Children: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          noOfChildren,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // profession
                      TableRow(children: [
                        Text(
                          "Profession: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          profession,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // employmentStatus
                      TableRow(children: [
                        Text(
                          "Employment Status: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          employmentStatus,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // income
                      TableRow(children: [
                        Text(
                          "Income: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          income,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // livingSituation
                      TableRow(children: [
                        Text(
                          "Living Situation: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          livingSituation,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table

                      const TableRow(children: [Text(""), Text("")]),

                      TableRow(children: [
                        // willingToRelocate
                        Text(
                          "Willing To Relocate: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          willingToRelocate,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // relationshipYouAreLookingFor
                      TableRow(children: [
                        Text(
                          "Rrelationship You AreLooking For: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          relationshipYouAreLookingFor,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),
                    ],
                  ),
                ),

                // Background - Cultural Values title
                SizedBox(
                  height: 30.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Background Cultural Values: ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),

                // Background - Cultural Values table data

                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(20.w),
                  child: Table(
                    children: [
                      // nationality
                      TableRow(children: [
                        Text(
                          "Nationality: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          nationality,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // education
                      TableRow(children: [
                        Text(
                          "Education: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          education,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),

                      // languageSpoken
                      TableRow(children: [
                        Text(
                          "Language Spoken: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          languageSpoken,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),
                      // religion
                      TableRow(children: [
                        Text(
                          "Religion: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          religion,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),
                      // ethnicity
                      TableRow(children: [
                        Text(
                          "Ethnicity: ",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                        Text(
                          ethnicity,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ]),

                      // extra table
                      const TableRow(children: [Text(""), Text("")]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

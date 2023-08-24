import 'dart:io';

import 'package:dating_app/controllers/authentication_controller.dart';
import 'package:dating_app/utils/app_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Widgets/custom_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
// personal info
  final TextEditingController emailTextEditingController =
      TextEditingController();

  final TextEditingController passwordEditingController =
      TextEditingController();

  final TextEditingController nameTextEditingController =
      TextEditingController();

  final TextEditingController ageTextEditingController =
      TextEditingController();

  final TextEditingController phoneNoTextEditingController =
      TextEditingController();

  final TextEditingController cityTextEditingController =
      TextEditingController();

  final TextEditingController countryTextEditingController =
      TextEditingController();

  final TextEditingController profileHeadingTextEditingController =
      TextEditingController();

  final TextEditingController lookingForInPartnerTextEditingController =
      TextEditingController();

  // Appearance
  final TextEditingController heightTextEditingController =
      TextEditingController();

  final TextEditingController weightEditingController = TextEditingController();

  final TextEditingController bodyTypeTextEditingController =
      TextEditingController();

  // Life style
  final TextEditingController drinkTextEditingController =
      TextEditingController();

  final TextEditingController smokeTextEditingController =
      TextEditingController();

  final TextEditingController martialStatusTextEditingController =
      TextEditingController();

  final TextEditingController haveChildrenTextEditingController =
      TextEditingController();

  final TextEditingController noOfChildrenTextEditingController =
      TextEditingController();

  final TextEditingController professionTextEditingController =
      TextEditingController();

  final TextEditingController employmentStatusTextEditingController =
      TextEditingController();

  final TextEditingController incomeTextEditingController =
      TextEditingController();

  final TextEditingController livingSituationTextEditingController =
      TextEditingController();

  final TextEditingController willingToRelocateTextEditingController =
      TextEditingController();

  final TextEditingController
      relationshipYouAreLookingForTextEditingController =
      TextEditingController();

  // Background - Cultural Values
  final TextEditingController nationalityTextEditingController =
      TextEditingController();

  final TextEditingController educationTextEditingController =
      TextEditingController();

  final TextEditingController languageSpokenTextEditingController =
      TextEditingController();

  final TextEditingController religionTextEditingController =
      TextEditingController();

  final TextEditingController ethnicityTextEditingController =
      TextEditingController();

 // bool showProgressBar = false;

  final authenticationController = AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'to get started now',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),

              // choose image circle avatar
          authenticationController.imageFile== null
                  ? CircleAvatar(
                      radius: 80.r,
                      backgroundImage: AssetImage(AppImage.profile),
                      backgroundColor: Colors.black,
                    )
                  : Container(
                      width: 180.w,
                      height: 180.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: FileImage(File(
                                  authenticationController.imageFile!.path)))),
                    ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        await authenticationController
                            .pickImageFileFromGallery();
                        setState(() {
                          authenticationController.imageFile;
                        });

                      },
                      icon: Icon(
                        Icons.image_outlined,
                        color: Colors.grey,
                        size: 30.sp,
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                      onPressed: () async {
                        await authenticationController.captureImageFromCamera();
                        setState(() {
                          authenticationController.imageFile;
                        });
                      },
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.grey,
                        size: 30.sp,
                      )),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),

              // personal info
              Text(
                'Personal Info:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.h,
              ),

              // name
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: nameTextEditingController,
                  labelText: 'Name',
                  iconData: Icons.person_outline,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // email
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: emailTextEditingController,
                  labelText: 'Email',
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // password
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: passwordEditingController,
                  labelText: 'Password',
                  iconData: Icons.lock_open_outlined,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // age

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: ageTextEditingController,
                  labelText: 'Age',
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // phoneNo

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: phoneNoTextEditingController,
                  labelText: 'Phone',
                  iconData: Icons.phone,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // city

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: cityTextEditingController,
                  labelText: 'City',
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // country

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: countryTextEditingController,
                  labelText: 'Country',
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // profileHeading

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: profileHeadingTextEditingController,
                  labelText: 'Profile Heading',
                  iconData: Icons.text_fields,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // lookingForInaPartner

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController:
                      lookingForInPartnerTextEditingController,
                  labelText: "What you're looking for in a partner",
                  iconData: Icons.face,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // Appearance

              Text(
                'Appearance:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.h,
              ),

              // height

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: heightTextEditingController,
                  labelText: 'Height',
                  iconData: Icons.insert_chart,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // weight

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: weightEditingController,
                  labelText: 'Weight',
                  iconData: Icons.table_chart,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // bodyType

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: bodyTypeTextEditingController,
                  labelText: 'Body Type',
                  iconData: Icons.type_specimen,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // Life style
              Text(
                'Life style:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.h,
              ),

              // drink

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: drinkTextEditingController,
                  labelText: 'Drink',
                  iconData: Icons.local_drink_outlined,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // smoke

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: smokeTextEditingController,
                  labelText: 'Smoke',
                  iconData: Icons.smoking_rooms,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // martialStatus

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: martialStatusTextEditingController,
                  labelText: 'Martial Status',
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // haveChildren

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: haveChildrenTextEditingController,
                  labelText: 'Do you have Children?',
                  iconData: CupertinoIcons.person_3_fill,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // noOfChildren

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: noOfChildrenTextEditingController,
                  labelText: 'Number of Children',
                  iconData: CupertinoIcons.person_3_fill,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // profession

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: professionTextEditingController,
                  labelText: 'Profession',
                  iconData: Icons.business_center,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // employmentStatus

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: employmentStatusTextEditingController,
                  labelText: 'Employment Status',
                  iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // income

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: incomeTextEditingController,
                  labelText: 'Income',
                  iconData: CupertinoIcons.money_dollar_circle,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // livingSituation

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: livingSituationTextEditingController,
                  labelText: 'Living Situation ',
                  iconData: CupertinoIcons.person_2_square_stack,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // willingToRelocate

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: willingToRelocateTextEditingController,
                  labelText: 'Are you willing to Relocate?',
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // relationshipYouAreLookingFor

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController:
                      relationshipYouAreLookingForTextEditingController,
                  labelText: 'What relationship you are looking for?',
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // Background - Cultural Values

              Text(
                'Background - Cultural Values:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.h,
              ),

              // nationality

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: nationalityTextEditingController,
                  labelText: 'Nationality',
                  iconData: Icons.flag_circle_outlined,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // education

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: educationTextEditingController,
                  labelText: 'Education',
                  iconData: Icons.history_edu,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // languageSpoken

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: languageSpokenTextEditingController,
                  labelText: 'Language Spoken',
                  iconData: CupertinoIcons.person_badge_plus_fill,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // religion

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: religionTextEditingController,
                  labelText: 'Religion',
                  iconData: CupertinoIcons.checkmark_seal_fill,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // ethnicity

              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55.h,
                child: CustomTextField(
                  textEditingController: ethnicityTextEditingController,
                  labelText: 'Ethnicity',
                  iconData: CupertinoIcons.eye,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              // create account button
              Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width - 36,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r)),
                child: InkWell(
                  onTap: () async{
                    if (authenticationController.imageFile != null) {
                      if (nameTextEditingController.text.trim().isNotEmpty &&
                          emailTextEditingController.text.trim().isNotEmpty &&
                          passwordEditingController.text.trim().isNotEmpty &&
                          ageTextEditingController.text.trim().isNotEmpty &&
                          phoneNoTextEditingController.text.trim().isNotEmpty &&
                          cityTextEditingController.text.trim().isNotEmpty &&
                          countryTextEditingController.text.trim().isNotEmpty &&
                          profileHeadingTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          lookingForInPartnerTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          heightTextEditingController.text.trim().isNotEmpty &&
                          weightEditingController.text.trim().isNotEmpty &&
                          bodyTypeTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          drinkTextEditingController.text.trim().isNotEmpty &&
                          smokeTextEditingController.text.trim().isNotEmpty &&
                          martialStatusTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          haveChildrenTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          noOfChildrenTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          professionTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          employmentStatusTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          incomeTextEditingController.text.trim().isNotEmpty &&
                          livingSituationTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          willingToRelocateTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          relationshipYouAreLookingForTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          nationalityTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          educationTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          languageSpokenTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          religionTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          ethnicityTextEditingController.text
                              .trim()
                              .isNotEmpty) {



                     await authenticationController.createNewUserAccount(
                            authenticationController.profileImage!,
                            emailTextEditingController.text.trim(),
                            passwordEditingController.text.trim(),
                            nameTextEditingController.text.trim(),
                            ageTextEditingController.text.trim(),
                            phoneNoTextEditingController.text.trim(),
                            cityTextEditingController.text.trim(),
                            countryTextEditingController.text.trim(),

                            profileHeadingTextEditingController.text.trim(),
                            lookingForInPartnerTextEditingController.text.trim(),

                            heightTextEditingController.text.trim(),
                            weightEditingController.text.trim(),
                            bodyTypeTextEditingController.text.trim(),
                            drinkTextEditingController.text.trim(),
                            smokeTextEditingController.text.trim(),
                            martialStatusTextEditingController.text.trim(),
                            haveChildrenTextEditingController.text.trim(),
                            noOfChildrenTextEditingController.text.trim(),
                            professionTextEditingController.text.trim(),
                            employmentStatusTextEditingController.text.trim(),
                            incomeTextEditingController.text.trim(),
                            livingSituationTextEditingController.text.trim(),
                            willingToRelocateTextEditingController.text.trim(),
                            relationshipYouAreLookingForTextEditingController.text.trim(),
                            nationalityTextEditingController.text.trim(),
                            educationTextEditingController.text.trim(),
                            languageSpokenTextEditingController.text.trim(),
                            religionTextEditingController.text.trim(),
                            ethnicityTextEditingController.text.trim());

                     setState(() {
                       authenticationController.imageFile = null;
                     });



                      } else {
                        Get.snackbar('A Field is Empty',
                            "Please fill out all field in text fields");
                      }
                    } else {
                      Get.snackbar('Image File Missing',
                          "Please pick image from Gallery or capture with Camera");
                    }
                  },
                  child: Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 16.h,
              ),

              // Already have an account login here button

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'Login Here',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),

              SizedBox(
                height: 16.h,
              ),
              Obx(() => authenticationController.showProgressBar.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                    )
                  : Container()),

              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

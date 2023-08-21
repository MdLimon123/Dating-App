
import 'package:dating_app/Views/authenticationScreen/registration_screen.dart';
import 'package:dating_app/Widgets/custom_text_field.dart';
import 'package:dating_app/controllers/authentication_controller.dart';
import 'package:dating_app/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final TextEditingController emailTextEditingController = TextEditingController();

   final TextEditingController passwordEditingController = TextEditingController();

   final _loginController = AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100.h,),
              Image.asset(AppImage.logo,width: 290.w,),

              Text('Welcome',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.sp
              ),),
              SizedBox(height: 5.h,),
              Text(' Login now to find your best Match',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp
              ),),
              SizedBox(height: 28.h,),
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
              SizedBox(height: 20.h,),
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
              SizedBox(height: 20.h,),

              // login button
              Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width - 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r)
                ),
                child: InkWell(
                  onTap: ()async{

                    if(emailTextEditingController.text.trim().isNotEmpty && passwordEditingController.text.trim().isNotEmpty){
                     await _loginController.loginUser(emailTextEditingController.text.trim(), passwordEditingController.text.trim());
                    }else{
                      Get.snackbar("Email/Password is Missing", "Please fill all fields.");
                    }

                  },
                  child: Center(
                    child: Text('Login',style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),),
                  ),
                ),

              ),

              SizedBox(height: 16.h,),
// don't have an account create here button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey
                  ),),

                  InkWell(
                    onTap: (){
                      Get.to(RegistrationScreen());
                    },
                      child: Text('Create Here',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),))

                ],
              ),

              SizedBox(height: 16.h,),
              Obx(() => _loginController.showProgressBar.value? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(

                  Colors.pink
                ),
              ):Container()),

              SizedBox(height: 30.h,),




            ],
          ),
        )
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final IconData? iconData;
  final String? assetRef;
  final String? labelText;
  final bool? isObscure;

  CustomTextField({
    super.key,
    this.textEditingController,
    this.iconData,
    this.assetRef,
    this.isObscure,
    this.labelText
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: iconData !=null?Icon(iconData):
            Padding(padding: EdgeInsets.all(8.w),
            child: Image.asset(assetRef.toString()),),
        labelStyle: TextStyle(
          fontSize: 18.sp
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: const BorderSide(
            color: Colors.grey
          )
        ),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: const BorderSide(
                color: Colors.grey
            )
        )
      ),
      obscureText: isObscure!,
    );
  }
}

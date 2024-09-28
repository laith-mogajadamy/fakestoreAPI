import 'package:fakestoreapi/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DecriptionInput extends StatelessWidget {
  const DecriptionInput({
    super.key,
    required this.description,
  });

  final TextEditingController description;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: description,
      minLines: 10,
      maxLines: 30,
      style: TextStyle(color: Colors.black, fontSize: 18.sp),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        hintText: "description",
        hintStyle: TextStyle(
            fontSize: 24.sp,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.bold,
            decorationThickness: 3,
            decorationStyle: TextDecorationStyle.dotted),
        filled: true,
        fillColor: Colors.black12,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}

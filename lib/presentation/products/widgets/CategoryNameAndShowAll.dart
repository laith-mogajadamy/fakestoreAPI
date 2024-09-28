import 'package:fakestoreapi/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CategoryNameAndShowAll extends StatelessWidget {
  final String name;
  GestureTapCallback showAllCallBack;
  CategoryNameAndShowAll(
      {super.key, required this.name, required this.showAllCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      height: 43.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: showAllCallBack,
            child: Row(
              children: [
                Icon(
                  Icons.keyboard_arrow_left,
                  size: 30.r,
                  color: AppColor.primaryColor,
                ),
                Text(
                  "Show All",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

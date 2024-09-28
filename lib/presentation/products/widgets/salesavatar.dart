import 'package:fakestoreapi/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalesAvatar extends StatelessWidget {
  final String name;
  const SalesAvatar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white12,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height / 10,
            width: size.width / 4,
            child: Image.network(
              "https://t4.ftcdn.net/jpg/00/81/38/59/360_F_81385977_wNaDMtgrIj5uU5QEQLcC9UNzkJc57xbu.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: size.width / 5,
            height: size.height / 12,
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

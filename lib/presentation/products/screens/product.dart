import 'package:fakestoreapi/core/utils/app_color.dart';
import 'package:fakestoreapi/models/product.dart';
import 'package:fakestoreapi/presentation/products/widgets/productbotoom.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        titleTextStyle: TextStyle(color: Colors.blue, fontSize: 22.sp),
        title: Text(
          product.title,
          style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: ProductBottom(
        product: product,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
              child: SizedBox(
                width: double.infinity,
                height: size.height / 3,
                child: Image.network(
                  product.image,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Text(
                product.title,
                style: TextStyle(fontSize: 20.sp, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Divider(
                color: const Color.fromARGB(255, 95, 95, 95),
                thickness: 1.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "description:",
                    style: TextStyle(fontSize: 20.sp, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Text(
                product.description,
                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 14.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Row(
                children: [
                  Text(
                    "rate: ",
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    " ${product.rate.rate}",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

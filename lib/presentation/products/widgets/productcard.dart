import 'package:fakestoreapi/core/utils/app_color.dart';
import 'package:fakestoreapi/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: SizedBox(
        width: size.width / 2.7,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 5.r,
                blurStyle: BlurStyle.outer,
                spreadRadius: 5.r,
                color: Colors.grey),
          ], borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height / 5.5,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      scale: 1,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                        product.image,
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.sp, color: AppColor.textColor),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: size.height / 13,
                child: ListTile(
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "${product.price.toString()} \$",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

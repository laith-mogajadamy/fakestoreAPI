import 'package:fakestoreapi/core/utils/app_color.dart';
import 'package:fakestoreapi/models/product.dart';
import 'package:fakestoreapi/presentation/cart/controllers/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBottom extends StatelessWidget {
  final Product product;

  const ProductBottom({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "  Price:   ",
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textColor),
              ),
              Text(
                "${product.price.toString()} \$",
                style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              fixedSize: Size(250.w, 40.h),
            ),
            onPressed: () {
              context.read<CartBloc>().add(
                    AddProductToBasket(
                      productModel: product,
                    ),
                  );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    "product is add successfully",
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.shopping_cart,
              size: 30.h,
              color: AppColor.whiteColor,
            ),
            label: Text(
              "Add to the cart",
              style: TextStyle(fontSize: 18.sp, color: AppColor.whiteColor),
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}

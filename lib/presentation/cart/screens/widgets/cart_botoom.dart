import 'package:fakestoreapi/core/utils/app_color.dart';
import 'package:fakestoreapi/models/product.dart';
import 'package:fakestoreapi/presentation/cart/controllers/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CartBottom extends StatelessWidget {
  List<Product> products;

  CartBottom({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    double sum = 0;
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (BuildContext context, CartState state) {
        products = state.basketProducts;
        for (var i = 0; i < state.basketProducts.length; i++) {
          sum += state.basketProducts[i].price;
        }
        return Container(
          height: 125.h,
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
              Text(
                "Cart bill:",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    "  Total:   ",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.textColor),
                  ),
                  Text(
                    "${state.cartsum} \$",
                    style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  fixedSize: Size(250.w, 40.h),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_checkout,
                  size: 30.r,
                  color: AppColor.whiteColor,
                ),
                label: Text(
                  "checkout",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        );
      },
    );
  }
}

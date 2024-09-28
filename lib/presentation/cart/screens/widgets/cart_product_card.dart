import 'package:fakestoreapi/core/utils/app_color.dart';
import 'package:fakestoreapi/models/product.dart';
import 'package:fakestoreapi/presentation/cart/controllers/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductCard extends StatelessWidget {
  final Product products;
  final int index;

  const CartProductCard({
    super.key,
    required this.products,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 8.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: InkWell(
                      onTap: () {
                        context.read<CartBloc>().add(
                              DeleteProductFromBasket(index: index),
                            );
                      },
                      child: Icon(
                        Icons.close,
                        size: 15.r,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Container(
                      height: size.height / 5,
                      width: size.width / 4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          scale: 1,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            products.image.isNotEmpty ? products.image : '',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width / 1.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        products.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 10,
                      thickness: 0.5,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Price"),
                          Text(
                            "${products.price}",
                            style: TextStyle(
                                color: AppColor.textColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 10,
                      thickness: 0.5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Amount"),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove,
                                    color: Colors.grey),
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                        MinusOne(index: index),
                                      );
                                },
                              ),
                              Text("${products.amount}",
                                  style: const TextStyle(color: Colors.grey)),
                              IconButton(
                                icon: const Icon(Icons.add, color: Colors.grey),
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(IncreaseOne(index: index));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 10,
                      thickness: 0.5,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total"),
                          Text(
                            "${products.total}",
                            style: TextStyle(
                                color: AppColor.textColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: const Divider(
            color: Colors.grey,
            height: 10,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

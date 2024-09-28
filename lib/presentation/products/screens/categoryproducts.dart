import 'package:fakestoreapi/core/utils/app_color.dart';
import 'package:fakestoreapi/presentation/products/components/category_product_component.dart';
import 'package:fakestoreapi/presentation/products/controllers/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProducts extends StatelessWidget {
  final ProductsEvent event;
  final String categoryName;

  const CategoryProducts({
    super.key,
    required this.event,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 22.sp,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView(
            children: [
              CategoryProductComponent(
                event: event,
                categoryname: categoryName,
              ),
            ],
          )),
        ],
      ),
    );
  }
}

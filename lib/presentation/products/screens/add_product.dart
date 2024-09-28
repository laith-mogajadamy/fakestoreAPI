import 'package:fakestoreapi/core/utils/app_color.dart';
import 'package:fakestoreapi/core/utils/formstatus.dart';
import 'package:fakestoreapi/presentation/products/controllers/products_bloc.dart';
import 'package:fakestoreapi/presentation/products/widgets/decription_input.dart';
import 'package:fakestoreapi/presentation/products/widgets/info_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  bool bottom = false;
  final formKey = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController category = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            title: Text(
              "Add Product",
              style: TextStyle(fontSize: 20.sp, color: AppColor.whiteColor),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoInput(
                              name: "title",
                              hint: "product name",
                              validator: (value) => null,
                              onchange: null,
                              controller: title),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                              name: "price",
                              hint: "50",
                              validator: (value) => null,
                              onchange: null,
                              controller: price),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "description:",
                            style: TextStyle(
                                fontSize: 18.sp, color: AppColor.textColor),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          DecriptionInput(description: description),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                            name: "image",
                            hint:
                                "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
                            validator: null,
                            onchange: null,
                            controller: image,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InfoInput(
                            name: "category",
                            hint: "electronics",
                            validator: null,
                            onchange: null,
                            controller: category,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Center(
                            child: BlocListener<ProductsBloc, ProductsState>(
                              listener: (context, state) {
                                if (state.addproductformSubmissionStatus
                                    is SubmissionSuccess) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.green,
                                      duration: const Duration(seconds: 2),
                                      content: Text(
                                        "product added successfully",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).pop();
                                } else if (state.addproductformSubmissionStatus
                                    is SubmissionFailed) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      duration: const Duration(seconds: 2),
                                      content: Text(
                                        "product add failed",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<ProductsBloc>().add(
                                        AddProduct(
                                          title: title.text,
                                          price: double.parse(price.text),
                                          description: description.text,
                                          image: image.text,
                                          category: category.text,
                                        ),
                                      );
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize:
                                      Size(size.width / 2.3, size.height / 15),
                                  backgroundColor: AppColor.primaryColor,
                                  shape: const StadiumBorder(),
                                ),
                                child: (state.addproductformSubmissionStatus
                                        is FormSubmitting)
                                    ? CircularProgressIndicator(
                                        color: AppColor.whiteColor,
                                        strokeWidth: 2.w,
                                      )
                                    : Text(
                                        "Add product",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: AppColor.whiteColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}

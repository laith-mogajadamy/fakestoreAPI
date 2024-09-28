import 'package:fakestoreapi/core/utils/app_color.dart';
import 'package:fakestoreapi/core/utils/enums.dart';
import 'package:fakestoreapi/presentation/products/components/H_CategoryProductsComponent.dart';
import 'package:fakestoreapi/presentation/products/components/all_products_component.dart';
import 'package:fakestoreapi/presentation/products/components/categories_component.dart';
import 'package:fakestoreapi/presentation/products/controllers/products_bloc.dart';
import 'package:fakestoreapi/presentation/products/screens/categoryproducts.dart';
import 'package:fakestoreapi/presentation/products/widgets/CategoryNameAndShowAll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ProductsBloc()
        ..add(
          GetCategories(),
        ),
      child: BlocBuilder<ProductsBloc, ProductsState>(
        buildWhen: (previous, current) =>
            previous.categoriesState != current.categoriesState,
        builder: (context, state) {
          switch (state.categoriesState) {
            case RequestState.loading:
              return Container(
                alignment: Alignment.center,
                height: size.height,
                width: size.width,
                child: Center(
                  child: Lottie.asset(
                    'assets/lottie/waiting.json',
                    fit: BoxFit.fill,
                    width: size.width / 1,
                    height: size.height / 2,
                  ),
                ),
              );
            case RequestState.loaded:
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        (index == 0)
                            ? const CategoriesComponent()
                            : const SizedBox(
                                height: 0,
                                width: 0,
                              ),
                        CategoryNameAndShowAll(
                          name: state.categories[index],
                          showAllCallBack: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryProducts(
                                  event: GetCategoryProducts(
                                    name: state.categories[index],
                                  ),
                                  categoryName: state.categories[index],
                                ),
                              ),
                            );
                          },
                        ),
                        HCategoryProductsComponent(
                          event: GetCategoryProducts(
                            name: state.categories[index],
                          ),
                          categoryId: state.categories[index],
                        ),
                        (index == state.categories.length - 1)
                            ? Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: Text(
                                      "All products",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  AllProductComponent(
                                    event: GetProducts(),
                                  )
                                ],
                              )
                            : const SizedBox.shrink(),
                      ],
                    );
                  },
                ),
              );
            case RequestState.error:
              return SizedBox(
                height: 280.h,
                child: Center(
                  child: Text(state.categoriesMessage),
                ),
              );
          }
        },
      ),
    );
  }
}

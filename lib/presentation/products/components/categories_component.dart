import 'package:fakestoreapi/presentation/products/controllers/products_bloc.dart';
import 'package:fakestoreapi/presentation/products/screens/categoryproducts.dart';
import 'package:fakestoreapi/presentation/products/widgets/salesavatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ProductsBloc, ProductsState>(
        buildWhen: (previous, current) =>
            previous.categoriesState != current.categoriesState,
        builder: (context, state) {
          return Container(
            color: Colors.white12,
            height: size.height / 4.9,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
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
                  child: SalesAvatar(
                    name: state.categories[index],
                  ),
                );
              },
            ),
          );
        });
  }
}

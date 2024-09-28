import 'package:fakestoreapi/core/utils/enums.dart';
import 'package:fakestoreapi/presentation/products/controllers/products_bloc.dart';
import 'package:fakestoreapi/presentation/products/screens/product.dart';
import 'package:fakestoreapi/presentation/products/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HCategoryProductsComponent extends StatelessWidget {
  final ProductsEvent event;
  final String categoryId;

  const HCategoryProductsComponent({
    super.key,
    required this.event,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ProductsBloc()..add(event),
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          switch (state.categoryproductsState) {
            case RequestState.loading:
              return Container(
                alignment: Alignment.center,
                child: Center(
                  child: Lottie.asset(
                    'assets/lottie/waiting.json',
                    fit: BoxFit.fill,
                  ),
                ),
              );
            case RequestState.loaded:
              return Column(
                children: [
                  SizedBox(
                    height: size.height / 2.5,
                    width: double.infinity.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categoryproducts.length < 20
                          ? state.categoryproducts.length
                          : 20,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                  product: state.categoryproducts[index],
                                ),
                              ),
                            );
                          },
                          child: ProductCard(
                            product: state.categoryproducts[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            case RequestState.error:
              return SizedBox(
                height: 280.h,
                child: Center(
                  child: Text(state.categoryproductsMessage),
                ),
              );
          }
        },
      ),
    );
  }
}

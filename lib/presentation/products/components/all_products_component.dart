import 'package:fakestoreapi/core/utils/enums.dart';
import 'package:fakestoreapi/presentation/products/controllers/products_bloc.dart';
import 'package:fakestoreapi/presentation/products/screens/product.dart';
import 'package:fakestoreapi/presentation/products/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class AllProductComponent extends StatelessWidget {
  final ProductsEvent event;

  const AllProductComponent({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ProductsBloc()..add(event),
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          switch (state.productsState) {
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
              return Column(
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.59),
                    itemCount: state.products.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                        product: state.products[index],
                                      )));
                        },
                        child: ProductCard(
                          product: state.products[index],
                        ),
                      );
                    },
                  ),
                ],
              );
            case RequestState.error:
              return SizedBox(
                height: 280.h,
                child: Center(
                  child: Text(state.productsMessage),
                ),
              );
          }
        },
      ),
    );
  }
}

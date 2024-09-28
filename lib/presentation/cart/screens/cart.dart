import 'package:fakestoreapi/core/utils/app_color.dart';
import 'package:fakestoreapi/models/product.dart';
import 'package:fakestoreapi/presentation/cart/controllers/cart_bloc.dart';
import 'package:fakestoreapi/presentation/cart/screens/widgets/cart_botoom.dart';
import 'package:fakestoreapi/presentation/cart/screens/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<Product> products;
          products = state.basketProducts;

          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: products.isNotEmpty
                ? CartBottom(
                    products: products,
                  )
                : null,
            body: products.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.basketProducts.isNotEmpty
                              ? state.basketProducts.length
                              : 0,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.h, vertical: 8.h),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: InkWell(
                                              onTap: () {
                                                context.read<CartBloc>().add(
                                                      DeleteProductFromBasket(
                                                          index: index),
                                                    );
                                              },
                                              child: Icon(
                                                Icons.close,
                                                size: 15.r,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.h),
                                            child: Container(
                                              height: size.height / 5,
                                              width: size.width / 4,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  scale: 1,
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    state.basketProducts[index]
                                                            .image.isNotEmpty
                                                        ? state
                                                            .basketProducts[
                                                                index]
                                                            .image
                                                        : '',
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              child: Text(
                                                state.basketProducts[index]
                                                    .title,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    TextStyle(fontSize: 16.sp),
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text("Price"),
                                                  Text(
                                                    "${state.basketProducts[index].price}",
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.textColor,
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text("Amount"),
                                                SizedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.remove,
                                                            color: Colors.grey),
                                                        onPressed: () {
                                                          context
                                                              .read<CartBloc>()
                                                              .add(
                                                                MinusOne(
                                                                    index:
                                                                        index),
                                                              );
                                                        },
                                                      ),
                                                      Text(
                                                          "${state.basketProducts[index].amount}",
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey)),
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.add,
                                                            color: Colors.grey),
                                                        onPressed: () {
                                                          context
                                                              .read<CartBloc>()
                                                              .add(IncreaseOne(
                                                                  index:
                                                                      index));
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text("Total"),
                                                  Text(
                                                    "${state.basketProducts[index].total}",
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.textColor,
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.h),
                                  child: const Divider(
                                    color: Colors.grey,
                                    height: 10,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.grey.shade400,
                        size: 80.r,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(
                            "Your shoppig cart is empty",
                            style: TextStyle(
                                fontSize: 24.sp, color: AppColor.textColor),
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(
                            "Before proceeding with payment, you must add some products to your shopping cart. You will find many interesting products on our shopping page,",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

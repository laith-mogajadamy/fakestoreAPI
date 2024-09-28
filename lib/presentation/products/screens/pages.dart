import 'package:fakestoreapi/presentation/cart/screens/cart.dart';
import 'package:fakestoreapi/core/utils/app_color.dart';
import 'package:fakestoreapi/presentation/products/controllers/products_bloc.dart';
import 'package:fakestoreapi/presentation/products/screens/add_product.dart';
import 'package:fakestoreapi/presentation/products/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPages extends StatefulWidget {
  const MyPages({super.key});

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  late int select = 0;
  late PageController controller;
  bool hasnet = true;

  @override
  void initState() {
    super.initState();

    controller = PageController(initialPage: select, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(),
      child: WillPopScope(
        onWillPop: () async {
          if (select != 0) {
            controller.jumpToPage(0);
            setState(() {
              select = 0;
            });
            return false;
          } else {
            SystemNavigator.pop();
            return true;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            title: Text(
              "fakestore",
              style: TextStyle(color: AppColor.whiteColor, fontSize: 18.sp),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProductPage(),
              ),
            ),
            child: const Icon(Icons.add),
          ),
          body: PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              Home(),
              CartScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25.r,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 25.r,
                ),
                label: "Cart",
              ),
            ],
            currentIndex: select,
            onTap: (index) {
              setState(() {
                select = index;
              });
              controller.jumpToPage(select);
            },
            selectedItemColor: AppColor.primaryColor,
            selectedFontSize: 16.sp,
            selectedIconTheme:
                IconThemeData(size: 30.r, color: AppColor.primaryColor),
            showUnselectedLabels: true,
            unselectedIconTheme:
                IconThemeData(size: 30.r, color: AppColor.primaryColor),
            unselectedItemColor: AppColor.primaryColor,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

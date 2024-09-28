import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fakestoreapi/core/utils/enums.dart';
import 'package:fakestoreapi/core/utils/formstatus.dart';
import 'package:fakestoreapi/models/product.dart';
import 'package:fakestoreapi/models/product_model.dart';
import 'package:fakestoreapi/presentation/products/data/product_request.dart';
import 'package:http/http.dart' as http;

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const ProductsState()) {
    on<GetProducts>((event, emit) async {
      print("GetProducts");
      emit(state.copyWith(
        productsState: RequestState.loading,
      ));
      http.Response response = await ProductsReqwest.getproducts();
      var responsemap = jsonDecode(response.body);
      print("responsemap=");
      print(responsemap);
      if (response.statusCode == 200) {
        emit(state.copyWith(
          products: List<ProductModel>.from(
            (responsemap as List).map(
              (e) => ProductModel.fromJson(e),
            ),
          ),
          productsState: RequestState.loaded,
          //
        ));
        print("state.products=");
        print(state.products);
      } else {
        emit(state.copyWith(
          productsState: RequestState.error,
          productsMessage: responsemap["message"],
        ));
      }
    });
    //
    on<GetCategoryProducts>((event, emit) async {
      print("GetCategoriProducts");
      emit(state.copyWith(
        categoryproductsState: RequestState.loading,
      ));
      http.Response response = await ProductsReqwest.getcategoryproducts(
        event.name!,
      );
      var responsemap = jsonDecode(response.body);
      print("responsemap=");
      print(responsemap);
      if (response.statusCode == 200) {
        emit(state.copyWith(
          categoryproducts: List<ProductModel>.from(
            (responsemap as List).map(
              (e) => ProductModel.fromJson(e),
            ),
          ),
          categoryproductsState: RequestState.loaded,
          //
        ));
        print("state.categoryproducts=");
        print(state.categoryproducts);
      } else {
        emit(state.copyWith(
          categoryproductsState: RequestState.error,
          categoryproductsMessage: responsemap["message"],
        ));
      }
    });

    on<GetCategories>((event, emit) async {
      print("GetCategories");
      emit(state.copyWith(
        categoriesState: RequestState.loading,
      ));

      http.Response response = await ProductsReqwest.getcategories();
      var responsemap = jsonDecode(response.body);
      print("responsemap=");
      print(responsemap);
      if (response.statusCode == 200) {
        emit(state.copyWith(
          categories: List<String>.from(
            (responsemap as List),
          ),
          categoriesState: RequestState.loaded,
        ));
        print("state.categories=");
        print(state.categories);
      } else {
        emit(state.copyWith(
          categoriesState: RequestState.error,
          categoriesMessage: responsemap["message"],
        ));
      }
    });

    on<AddProduct>((event, emit) async {
      print("AddProduct");
      emit(
        state.copyWith(
          addproductformSubmissionStatus: FormSubmitting(),
        ),
      );

      http.Response response = await ProductsReqwest.addproduct(
        event.title!,
        event.price!,
        event.description!,
        event.image!,
        event.category!,
      );
      var responsemap = await jsonDecode(response.body);
      print("responsemap=");
      print(responsemap);
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            addproductformSubmissionStatus: SubmissionSuccess(),
          ),
        );
      } else {
        emit(state.copyWith(
          addproductformSubmissionStatus:
              SubmissionFailed('add product failed'),
        ));
      }
    });
  }
}

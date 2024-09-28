import 'package:equatable/equatable.dart';
import 'package:fakestoreapi/core/utils/enums.dart';
import 'package:fakestoreapi/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddProductToBasket>((event, emit) async {
      List<Product> myList = [];
      var product = event.productModel;
      product = Product(
        id: event.productModel.id,
        title: event.productModel.title,
        price: event.productModel.price,
        description: event.productModel.description,
        category: event.productModel.category,
        image: event.productModel.image,
        rate: event.productModel.rate,
        amount: 1,
        total: event.productModel.price,
      );
      myList.add(product);
      myList += state.basketProducts;
      dynamic sum = state.cartsum;
      dynamic newsum = sum + product.price;

      emit(state.copyWith(
        basketProducts: myList,
        cartsum: newsum,
      ));
    });
    on<DeleteProductFromBasket>((event, emit) async {
      print(event.index);
      List<Product> myList = [];
      myList += state.basketProducts;
      if (event.index < 0 || event.index >= myList.length) {
        return;
      }
      Product removedProduct = myList[event.index];
      myList.removeAt(event.index);
      dynamic sum = state.cartsum;
      dynamic newsum = sum - (removedProduct.price * removedProduct.amount);
      emit(
        state.copyWith(
          basketProducts: myList,
          cartsum: newsum,
        ),
      );
    });

    on<IncreaseOne>((event, emit) async {
      List<Product> myList = [];
      myList += state.basketProducts;
      var product = Product(
        id: myList[event.index].id,
        title: myList[event.index].title,
        price: myList[event.index].price,
        description: myList[event.index].description,
        category: myList[event.index].category,
        image: myList[event.index].image,
        rate: myList[event.index].rate,
        amount: myList[event.index].amount + 1,
        total: myList[event.index].total + myList[event.index].price,
      );
      myList[event.index] = product;
      dynamic sum = state.cartsum;
      dynamic newsum = sum + product.price;
      emit(
        state.copyWith(
          basketProducts: myList,
          cartsum: newsum,
        ),
      );
    });
    on<MinusOne>((event, emit) async {
      List<Product> myList = [];
      myList += state.basketProducts;
      if (myList[event.index].amount > 1) {
        var product = Product(
          id: myList[event.index].id,
          title: myList[event.index].title,
          price: myList[event.index].price,
          description: myList[event.index].description,
          category: myList[event.index].category,
          image: myList[event.index].image,
          rate: myList[event.index].rate,
          amount: myList[event.index].amount != 1
              ? myList[event.index].amount - 1
              : 1,
          total: myList[event.index].amount != 1
              ? myList[event.index].total - (myList[event.index].price)
              : (myList[event.index].price),
        );
        myList[event.index] = product;
        dynamic sum = state.cartsum;
        dynamic newsum = sum - product.price;
        emit(state.copyWith(
          basketProducts: myList,
          cartsum: newsum,
        ));
      } else {}
    });
    on<MakeBasketEmpty>((event, emit) async {
      List<Product> myList = [];
      emit(state.copyWith(
        basketProducts: myList,
        cartsum: 0,
      ));
    });
  }
}

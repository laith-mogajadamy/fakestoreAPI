part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddProductToBasket extends CartEvent {
  final Product productModel;

  const AddProductToBasket({required this.productModel});
}

class IncreaseOne extends CartEvent {
  final int index;
  const IncreaseOne({required this.index});
}

class MinusOne extends CartEvent {
  final int index;
  const MinusOne({required this.index});
}

class DeleteProductFromBasket extends CartEvent {
  final int index;
  const DeleteProductFromBasket({required this.index});
}

class MakeBasketEmpty extends CartEvent {
  const MakeBasketEmpty();
}

part of 'cart_bloc.dart';

class CartState extends Equatable {
  //1
  final List<Product> basketProducts;
  final RequestState basketProductsState;
  final String basketProductsMessage;

  //2
  final dynamic cartsum;
  const CartState({
    this.basketProducts = const [],
    this.basketProductsState = RequestState.loading,
    this.basketProductsMessage = '',
    this.cartsum = 0,
  });

  CartState copyWith({
    //3
    final List<Product>? basketProducts,
    final RequestState? basketProductsState,
    final String? basketProductsMessage,
    final dynamic cartsum,
  }) {
    // 4
    return CartState(
      basketProducts: basketProducts ?? this.basketProducts,
      basketProductsState: basketProductsState ?? this.basketProductsState,
      basketProductsMessage:
          basketProductsMessage ?? this.basketProductsMessage,
      cartsum: cartsum ?? this.cartsum,
    );
  }

  @override
  // 5
  List<Object?> get props => [
        basketProducts,
        basketProductsState,
        basketProductsMessage,
        cartsum,
      ];
}

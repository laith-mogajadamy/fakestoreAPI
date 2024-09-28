part of 'products_bloc.dart';

class ProductsState extends Equatable {
  //
  final List<Product> products;
  final RequestState productsState;
  final String productsMessage;
  //
  final List<String> categories;
  final RequestState categoriesState;
  final String categoriesMessage;
  //

  final List<Product> categoryproducts;
  final RequestState categoryproductsState;
  final String categoryproductsMessage;
  //
  final FormSubmissionStatus addproductformSubmissionStatus;
  const ProductsState({
    //
    this.products = const [],
    this.productsState = RequestState.loading,
    this.productsMessage = '',
    //
    this.categories = const [],
    this.categoriesState = RequestState.loading,
    this.categoriesMessage = '',
    //
    this.categoryproducts = const [],
    this.categoryproductsState = RequestState.loading,
    this.categoryproductsMessage = '',
    //
    this.addproductformSubmissionStatus = const InitialFormStatus(),
  });

  ProductsState copyWith({
    //
    List<Product>? products,
    RequestState? productsState,
    String? productsMessage,
    //
    List<String>? categories,
    RequestState? categoriesState,
    String? categoriesMessage,
    //
    List<Product>? categoryproducts,
    RequestState? categoryproductsState,
    String? categoryproductsMessage,
    //
    FormSubmissionStatus? addproductformSubmissionStatus,
  }) {
    return ProductsState(
      //
      products: products ?? this.products,
      productsState: productsState ?? this.productsState,
      productsMessage: productsMessage ?? this.productsMessage,
      //
      categories: categories ?? this.categories,
      categoriesState: categoriesState ?? this.categoriesState,
      categoriesMessage: categoriesMessage ?? this.categoriesMessage,
      //
      categoryproducts: categoryproducts ?? this.categoryproducts,
      categoryproductsState:
          categoryproductsState ?? this.categoryproductsState,
      categoryproductsMessage:
          categoryproductsMessage ?? this.categoryproductsMessage,
      //
      addproductformSubmissionStatus:
          addproductformSubmissionStatus ?? this.addproductformSubmissionStatus,
    );
  }

  @override
  List<Object?> get props => [
        //
        products,
        productsState,
        productsMessage,
        //
        categories,
        categoriesState,
        categoriesMessage,
        //
        categoryproducts,
        categoryproductsState,
        categoryproductsMessage,
        //
        addproductformSubmissionStatus,
      ];
}

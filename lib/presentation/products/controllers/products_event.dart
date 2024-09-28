part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {}

class GetProducts extends ProductsEvent {
  GetProducts();

  @override
  List<Object?> get props => [];
}

class GetCategoryProducts extends ProductsEvent {
  final String? name;

  GetCategoryProducts({
    this.name,
  });

  @override
  List<Object?> get props => [];
}

class GetCategories extends ProductsEvent {
  GetCategories();

  @override
  List<Object?> get props => [];
}

class AddProduct extends ProductsEvent {
  final String? title;
  final dynamic price;

  final String? description;
  final String? image;
  final String? category;

  AddProduct({
    this.title,
    this.price,
    this.description,
    this.image,
    this.category,
  });

  @override
  List<Object?> get props => [
        title,
        price,
        description,
        image,
        category,
      ];
}

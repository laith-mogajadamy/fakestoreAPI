import 'package:fakestoreapi/models/product.dart';
import 'package:fakestoreapi/models/rate_model.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required super.amount,
    required super.total,
    required super.rate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        price: json['price'] ?? 0,
        description: json['description'] ?? '',
        category: json['category'] ?? '',
        image: json['image'] ?? '',
        amount: json['amount'] ?? 0,
        total: json['total'] ?? 0.0,
        rate: RateModel.fromJson(json['rating'] ?? {}),
      );
}

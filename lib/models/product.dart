import 'package:equatable/equatable.dart';
import 'package:fakestoreapi/models/rate.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final int amount;
  final dynamic total;
  final Rate rate;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.amount,
    required this.total,
    required this.rate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
        amount,
        total,
        rate,
      ];
}

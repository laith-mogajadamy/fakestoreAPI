import 'package:fakestoreapi/models/rate.dart';

class RateModel extends Rate {
  const RateModel({
    required super.rate,
    required super.count,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
        rate: json['rate'] ?? 0.0,
        count: json['count'] ?? 0.0,
      );
}

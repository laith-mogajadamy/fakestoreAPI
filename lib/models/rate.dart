import 'package:equatable/equatable.dart';

class Rate extends Equatable {
  final dynamic rate;
  final dynamic count;

  const Rate({
    required this.rate,
    required this.count,
  });

  @override
  List<Object?> get props => [
        rate,
        count,
      ];
}

import 'product_abstract.dart';

class Fruit extends Product {
  final double weight;
  Fruit({
    required super.title,
    required super.description,
    required super.price,
    required this.weight,
    super.category = Categories.fruits,
  });
}

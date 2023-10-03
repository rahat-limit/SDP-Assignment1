import 'product_abstract.dart';

class Snack extends Product {
  final int quantity;
  Snack(
      {required super.title,
      required super.description,
      required super.price,
      required this.quantity,
      super.category = Categories.snacks});
}

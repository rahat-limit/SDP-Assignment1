import 'dart:math';

enum Categories { snacks, fruits, other }

abstract class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final Categories category;

  Product(
      {id,
      required this.title,
      required this.description,
      required this.price,
      required this.category})
      : id = id ?? Random().nextInt(3);
}

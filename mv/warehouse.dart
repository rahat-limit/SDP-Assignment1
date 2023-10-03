import '../models/fruit_model.dart';
import '../models/product_abstract.dart';
import '../models/snack_model.dart';

class Warehouse {
  List<Product> products = [
    Fruit(
        title: 'Apples',
        description:
            'Apple, (Malus domestica), domesticated tree and fruit of the rose family (Rosaceae), one of the most widely cultivated tree fruits.',
        price: 1000,
        weight: 450),
    Snack(
        title: 'Snickers',
        description:
            "When you're looking for a snack that really satisfies, look no further than SNICKERS Peanut Butter Squared.",
        price: 300,
        quantity: 1),
    Snack(
        title: 'Twix',
        description:
            "TWIX Caramel and Chocolate Bars are a delicious combination of smooth chocolate, chewy caramel and crisp cookie.",
        price: 350,
        quantity: 1),
  ];

  List<Product> get getProducts => products;

  bool isExist(Product product) {
    final check = products.indexWhere((element) => element.id == product.id);
    if (check == -1) {
      return false;
    }
    return true;
  }

  addProduct(Product product) {
    products.add(product);
  }

  removeProduct(List<int> ids) {
    for (int i = 0; i < ids.length; i++) products.removeAt(ids[i]);
  }
}

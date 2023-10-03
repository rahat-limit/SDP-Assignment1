import '../models/product_abstract.dart';
import 'client.dart';
import 'validator.dart';
import 'warehouse.dart';

class Store {
  final Client client;
  Store(this.client);
  Warehouse _wareHouse = Warehouse(); // ---------> Singleton

  String requestBuy(Product product) {
    Validator _validator = Validator();
    // Check Card Validation
    bool isValid = _validator.validateCard(client.card);
    if (!isValid) {
      return 'Your Card is not Valid!';
    }
    // Check an existence of product
    bool isExist = _wareHouse.isExist(product);
    if (!isExist) {
      return 'No Products left!';
    }
    // Remove Product from Warehouse
    _wareHouse.removeProduct([product.id]);
    return 'Success!';
  }
}

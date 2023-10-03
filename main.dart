import 'dart:io';

import 'mv/client.dart';
import 'mv/store.dart';
import 'mv/warehouse.dart';

void main() {
  bool isClientIdentified = false;
  Client? _client;
  Warehouse _warehouse = Warehouse();
  Store? _store;
  while (true) {
    if (!isClientIdentified) {
      print(
          'Write Your Card Information as Shown In Example and Separate them with Comma: (Example: 873249923112, 231, 2004-12-21)');
      String? cardInfo = stdin.readLineSync();
      _client = Client.fromString(cardInfo!);
      print('Successfully Signed a Card!');
      isClientIdentified = true;
      _store = Store(_client);
    }
    print('Enter 1 to see products.');
    String? intFlag = stdin.readLineSync();
    if (int.parse(intFlag!) == 1) {
      for (int i = 0; i < _warehouse.getProducts.length; i++) {
        String title = _warehouse.getProducts[i].title;
        String description = _warehouse.getProducts[i].description;
        String category = _warehouse.getProducts[i].category.name;
        print(
            'Index: ${i + 1}\nTitle: $title\nDescription: $description\nCategory: $category');
      }
      print('Write an index, in order to Buy Product.');
      String? intProductFlag = stdin.readLineSync();
      int index = int.parse(intProductFlag!);
      if (index > 0 && index <= _warehouse.getProducts.length) {
        String status = _store!.requestBuy(_warehouse.getProducts[index - 1]);
        print(status);
        if (status == 'Your Card is not Valid!') {
          isClientIdentified = false;
          _store = null;
          false;
        } else {
          break;
        }
      }
    }
  }
}
// 111111111111, 123, 2030-12-21
// Warehose - хранилище (has Categories, funcs: isExist, remove, add)
// Store - магазин (funcs: buy, refund)
// Client - клиент (funcs: getCategories, getProductsByCategories, )

// View as Client
// 1) Fill Client Model (CVV, NUMBER, End_DATE)
// 2) View Products
// 3) Choose to Buy

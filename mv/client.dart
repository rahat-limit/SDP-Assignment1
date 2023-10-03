import 'dart:math';
import '../models/card_model.dart';

class Client {
  final int id;
  final Card card;
  Client({id, required this.card}) : id = id ?? Random().nextInt(3);

  factory Client.fromString(String info) {
    List<String> data = info.split(',');
    Card card = Card(
        number: int.parse(data.first),
        cvv: int.parse(data[1]),
        date: DateTime.parse(data[2].trim()));
    return Client(card: card);
  }
}

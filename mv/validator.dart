import '../models/card_model.dart';

class Validator {
  bool validateCard(Card card) {
    if (card.cvv.toString().length != 3 ||
        card.number.toString().length != 12) {
      return false;
    }
    final todaysDate = DateTime.now();
    int expired = todaysDate.compareTo(card.date);
    if (expired > 0) {
      return false;
    }
    return true;
  }
}

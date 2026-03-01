
import '../models/card_model.dart';

abstract class AddCardRemoteDataSource {
  Future<void> addCard({
    required CardModel cardData,
  });
}

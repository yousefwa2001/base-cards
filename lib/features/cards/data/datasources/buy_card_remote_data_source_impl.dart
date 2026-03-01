import '../../../card_values/domain/entities/card_value_entity.dart';
import '../../../home/domain/entities/card_category_entity.dart';
import '../../../region/domain/entities/region_entity.dart';
import '../../domain/entities/purchased_card_result.dart';

abstract class BuyCardRemoteDataSource {
  Future<PurchasedCardResult> buyAnyAvailableCard({
    required String buyerUid,
    required String buyerName,
    required CardCategoryEntity category,
    required RegionEntity region,
    required CardValueEntity value,
  });
}

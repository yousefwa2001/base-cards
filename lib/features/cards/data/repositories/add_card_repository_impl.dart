import 'package:base_cards/features/cards/data/models/card_model.dart';
import 'package:base_cards/features/home/domain/entities/card_category_entity.dart';
import 'package:base_cards/features/region/domain/entities/region_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../card_values/domain/entities/card_value_entity.dart';

import '../../domain/repositories/add_card_repository.dart';

import '../datasources/add_card_remote_data_source.dart';

class AddCardRepositoryImpl implements AddCardRepository {
  final AddCardRemoteDataSource remoteDataSource;

  AddCardRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, void>> addCard({
    required String cardCode,
    required String serialNumber,
    required CardCategoryEntity category,
    required RegionEntity region,
    required int? expiryMonth,
    required int? expiryYear,
    required CardValueEntity value,
    required String uid,
  }) async {
    try {
      await remoteDataSource.addCard(
        cardData: CardModel(
          code: cardCode,
          serialNumber: serialNumber,
          expiryMonth: expiryMonth,
          expiryYear: expiryYear,
          category: category.name,
          region: region.name,
          price: value.price,
          purchasePrice: value.purchasePrice,
          value: value.value,
          categoryId: category.id,
          regionId: region.id,
          valueId: value.id,
          createdBy: uid,
        ),
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}

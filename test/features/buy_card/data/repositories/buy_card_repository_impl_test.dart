// import 'package:base_cards/features/cards/data/datasources/buy_card_remote_data_source_impl.dart';
// import 'package:base_cards/features/cards/data/repositories/buy_card_repository_impl.dart';
// import 'package:base_cards/features/cards/domain/entities/purchased_card_result.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:dartz/dartz.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:base_cards/features/home/domain/entities/card_category_entity.dart';
// import 'package:base_cards/features/region/domain/entities/region_entity.dart';
// import 'package:base_cards/features/card_values/domain/entities/card_value_entity.dart';

// class MockBuyCardRemoteDataSource extends Mock
//     implements BuyCardRemoteDataSource {}

// class FakeCategory extends Fake implements CardCategoryEntity {}

// class FakeRegion extends Fake implements RegionEntity {}

// class FakeValue extends Fake implements CardValueEntity {}

// void main() {
//   late MockBuyCardRemoteDataSource remote;
//   late BuyCardRepositoryImpl repo;

//   setUpAll(() {
//     registerFallbackValue(FakeCategory());
//     registerFallbackValue(FakeRegion());
//     registerFallbackValue(FakeValue());
//   });

//   setUp(() {
//     remote = MockBuyCardRemoteDataSource();
//     repo = BuyCardRepositoryImpl(remoteDataSource: remote);
//   });

//   group('BuyCardRepositoryImpl.buyAnyAvailableCard', () {
//     test('returns Right(result) when remote succeeds', () async {
//       const buyerUid = 'u1';
//       final category = FakeCategory();
//       final region = FakeRegion();
//       final value = FakeValue();

//       const purchased = PurchasedCardResult(cardId: 'card_1', code: 'ABC-123');

//       when(
//         () => remote.buyAnyAvailableCard(
//           buyerUid: any(named: 'buyerUid'),
//           category: any(named: 'category'),
//           region: any(named: 'region'),
//           value: any(named: 'value'),
//         ),
//       ).thenAnswer((_) async => purchased);

//       final res = await repo.buyAnyAvailableCard(
//         buyerUid: buyerUid,
//         category: category,
//         region: region,
//         value: value,
//       );

//       expect(res, const Right(purchased));

//       verify(
//         () => remote.buyAnyAvailableCard(
//           buyerUid: buyerUid,
//           category: category,
//           region: region,
//           value: value,
//         ),
//       ).called(1);
//       verifyNoMoreInteractions(remote);
//     });

//     test(
//       'maps FirebaseException(insufficient-balance) to Failure(insufficient-balance)',
//       () async {
//         await _expectFirebaseCodeMapsToMessage(
//           repo: repo,
//           remote: remote,
//           code: 'insufficient-balance',
//           expectedMessage: 'insufficient-balance',
//         );
//       },
//     );

//     test('maps FirebaseException(no-cards) to Failure(no-cards)', () async {
//       await _expectFirebaseCodeMapsToMessage(
//         repo: repo,
//         remote: remote,
//         code: 'no-cards',
//         expectedMessage: 'no-cards',
//       );
//     });

//     test(
//       'maps FirebaseException(already-sold) to Failure(already-sold)',
//       () async {
//         await _expectFirebaseCodeMapsToMessage(
//           repo: repo,
//           remote: remote,
//           code: 'already-sold',
//           expectedMessage: 'already-sold',
//         );
//       },
//     );

//     test(
//       'maps FirebaseException(invalid-card) to Failure(invalid-card)',
//       () async {
//         await _expectFirebaseCodeMapsToMessage(
//           repo: repo,
//           remote: remote,
//           code: 'invalid-card',
//           expectedMessage: 'invalid-card',
//         );
//       },
//     );

//     test(
//       'maps unknown FirebaseException code to Failure(unexpected) with debugMessage',
//       () async {
//         const buyerUid = 'u1';
//         final category = FakeCategory();
//         final region = FakeRegion();
//         final value = FakeValue();

//         when(
//           () => remote.buyAnyAvailableCard(
//             buyerUid: any(named: 'buyerUid'),
//             category: any(named: 'category'),
//             region: any(named: 'region'),
//             value: any(named: 'value'),
//           ),
//         ).thenThrow(
//           FirebaseException(
//             plugin: 'cloud_firestore',
//             code: 'permission-denied',
//             message: 'Denied',
//           ),
//         );

//         final res = await repo.buyAnyAvailableCard(
//           buyerUid: buyerUid,
//           category: category,
//           region: region,
//           value: value,
//         );

//         // بدل ما نعتمد على == بين Failures (حسب تطبيقك)، نفحص القيم من جوّا
//         res.fold((f) {
//           expect(f.message, 'unexpected');
//           expect(f.debugMessage, 'Denied');
//         }, (_) => fail('Expected Left(Failure)'));
//       },
//     );

//     test('maps non-Firebase exception to Failure(e.toString())', () async {
//       const buyerUid = 'u1';
//       final category = FakeCategory();
//       final region = FakeRegion();
//       final value = FakeValue();

//       when(
//         () => remote.buyAnyAvailableCard(
//           buyerUid: any(named: 'buyerUid'),
//           category: any(named: 'category'),
//           region: any(named: 'region'),
//           value: any(named: 'value'),
//         ),
//       ).thenThrow(Exception('boom'));

//       final res = await repo.buyAnyAvailableCard(
//         buyerUid: buyerUid,
//         category: category,
//         region: region,
//         value: value,
//       );

//       res.fold(
//         (f) => expect(f.message, contains('boom')),
//         (_) => fail('Expected Left(Failure)'),
//       );
//     });
//   });
// }

// Future<void> _expectFirebaseCodeMapsToMessage({
//   required BuyCardRepositoryImpl repo,
//   required MockBuyCardRemoteDataSource remote,
//   required String code,
//   required String expectedMessage,
// }) async {
//   const buyerUid = 'u1';
//   final category = FakeCategory();
//   final region = FakeRegion();
//   final value = FakeValue();

//   when(
//     () => remote.buyAnyAvailableCard(
//       buyerUid: any(named: 'buyerUid'),
//       category: any(named: 'category'),
//       region: any(named: 'region'),
//       value: any(named: 'value'),
//     ),
//   ).thenThrow(
//     FirebaseException(plugin: 'cloud_firestore', code: code, message: 'msg'),
//   );

//   final res = await repo.buyAnyAvailableCard(
//     buyerUid: buyerUid,
//     category: category,
//     region: region,
//     value: value,
//   );

//   res.fold(
//     (f) => expect(f.message, expectedMessage),
//     (_) => fail('Expected Left(Failure)'),
//   );

//   verify(
//     () => remote.buyAnyAvailableCard(
//       buyerUid: buyerUid,
//       category: category,
//       region: region,
//       value: value,
//     ),
//   ).called(1);
//   verifyNoMoreInteractions(remote);
// }

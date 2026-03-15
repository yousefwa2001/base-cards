import 'package:base_cards/features/adjust_balance/data/datasources/adjust_balance_remote_datasource.dart';
import 'package:base_cards/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:base_cards/features/auth/data/datasources/auth_local_data_source_impl.dart';
import 'package:base_cards/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:base_cards/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:base_cards/features/auth/domain/usecases/logout_use_case.dart';
import 'package:base_cards/features/auth/domain/usecases/watch_auth_status_use_case.dart';
import 'package:base_cards/features/cards/data/datasources/add_card_remote_data_source.dart';
import 'package:base_cards/features/cards/data/datasources/buy_card_remote_data_source_impl.dart';
import 'package:base_cards/features/cards/domain/repositories/add_card_repository.dart';
import 'package:base_cards/features/cards/domain/usecases/add_card_usecase.dart';
import 'package:base_cards/features/cards/presentation/blocs/add_card_bloc/add_card_bloc.dart';
import 'package:base_cards/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:base_cards/features/auth/domain/usecases/login_use_case.dart';
import 'package:base_cards/features/shops/data/datasources/fetch_shops_remote_datasource.dart';
import 'package:base_cards/features/shops/data/datasources/fetch_shops_remote_datasource_impl.dart';
import 'package:base_cards/features/shops/domain/repositories/fetch_shops_repository.dart';
import 'package:base_cards/features/shops/domain/usecases/fetch_shops_use_case.dart';
import 'package:base_cards/features/shops/presentation/bloc/shops_bloc.dart';
import 'package:base_cards/features/home/presentation/blocs/user_name_cubit/user_name_cubit.dart';
import 'package:base_cards/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../core/storage/secure_storage_api.dart';
import '../../features/adjust_balance/data/datasources/adjust_balance_remote_datasourc_impl.dart';
import '../../features/adjust_balance/data/repositories/adjust_balance_repository_impl.dart';
import '../../features/adjust_balance/domain/repositories/adjust_balance_repository.dart';
import '../../features/adjust_balance/domain/usecases/adjust_balance_usecase.dart';
import '../../features/adjust_balance/presentation/bloc/adjust_balance_bloc.dart';
import '../../features/auth/domain/usecases/check_email_verified_use_case.dart';
import '../../features/auth/domain/usecases/forgot_password_use_case.dart';
import '../../features/auth/domain/usecases/register_use_case.dart';
import '../../features/auth/domain/usecases/send_email_verification_use_case.dart';
import '../../features/card_values/domain/usecases/update_purchase_price_usecase.dart';
import '../../features/cards/data/datasources/edit_card_remote_data_source.dart';
import '../../features/cards/data/datasources/edit_card_remote_data_source_impl.dart';
import '../../features/cards/data/repositories/edit_card_repository_impl.dart';
import '../../features/cards/domain/repositories/edit_card_repository.dart';
import '../../features/cards/domain/usecases/edit_card_use_case.dart';
import '../../features/cards/presentation/blocs/edit_card_bloc/edit_card_bloc.dart';
import '../../features/cards_inventory/data/datasources/cards_inventory_remote_data_source.dart';
import '../../features/cards_inventory/data/datasources/cards_inventory_remote_data_source_impl.dart';
import '../../features/cards_inventory/data/repositories/cards_inventory_repository_impl.dart';
import '../../features/cards_inventory/domain/repositories/cards_inventory_repository.dart';
import '../../features/cards_inventory/domain/usecases/cards_inventory_usecase.dart';
import '../../features/cards_inventory/presentation/bloc/cards_inventory_bloc.dart';
import '../../features/cards/data/datasources/add_card_remote_data_source_impl.dart';
import '../../features/cards/data/datasources/buy_card_remote_data_source.dart';
import '../../features/cards/data/repositories/add_card_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/cards/data/repositories/buy_card_repository_impl.dart';
import '../../features/cards/domain/repositories/buy_card_repository.dart';
import '../../features/cards/domain/usecases/buy_card_use_case.dart';
import '../../features/cards/presentation/blocs/buy_card_bloc/buy_card_bloc.dart';
import '../../features/card_values/data/datasources/card_values_remote_data_source.dart';
import '../../features/card_values/data/datasources/card_values_remote_data_source_impl.dart';
import '../../features/card_values/data/repositories/card_values_repository_impl.dart';
import '../../features/card_values/domain/repositories/card_values_repository.dart';
import '../../features/card_values/domain/usecases/card_values_usecase.dart';
import '../../features/card_values/presentation/bloc/card_values_bloc.dart';

import '../../features/shops/data/repositories/fetch_shops_repository_impl.dart';
import '../../features/home/data/datasources/categories_remote_data_source.dart';
import '../../features/home/data/datasources/categories_remote_data_source_impl.dart';
import '../../features/home/data/repositories/card_categories_repository_impl.dart';
import '../../features/home/domain/repositories/card_categories_repository.dart';
import '../../features/home/domain/usecases/get_all_categories_usecase.dart';

import '../../features/home/data/datasources/balance_remote_data_source.dart';
import '../../features/home/data/repositories/balance_repository_impl.dart';
import '../../features/home/domain/repositories/balance_repository.dart';
import '../../features/home/presentation/blocs/balanc_cubit/balance_cubit.dart';
import '../../features/purchase/data/datasources/purchase_remote_data_source.dart';
import '../../features/purchase/data/datasources/purchase_remote_data_source_impl.dart';
import '../../features/purchase/data/repositories/purchase_repository_impl.dart';
import '../../features/purchase/domain/repositories/purchase_repository.dart';
import '../../features/purchase/domain/usecases/purchase_use_case.dart';
import '../../features/purchase/presentation/bloc/purchase_bloc.dart';
import '../../features/region/data/data_sources/region_remote_data_source.dart';
import '../../features/region/data/data_sources/region_remote_data_source_impl.dart';
import '../../features/region/data/repositories/region_repository_impl.dart';

import '../../features/region/domain/repositories/region_repository.dart';
import '../../features/region/domain/use_cases/region_use_case.dart';
import '../../features/region/presentation/bloc/region_bloc.dart';
import '../../features/transactions/data/datasources/transactions_remote_data_source.dart';
import '../../features/transactions/data/datasources/transactions_remote_data_source_impl.dart';
import '../../features/transactions/data/repositories/transactions_repository_impl.dart';
import '../../features/transactions/domain/repositories/transactions_repository.dart';
import '../../features/transactions/domain/usecases/transactions_use_case.dart';
import '../../features/transactions/presentation/bloc/transactions_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // 🧩 Firebase
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // 🔐 Secure Storage
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<SecureStorageApi>(
    () => SecureStorageApi(getIt<FlutterSecureStorage>()),
  );
  // ##################### Auth ########################
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      auth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(storage: getIt<SecureStorageApi>()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      local: getIt<AuthLocalDataSource>(),
      remote: getIt<AuthRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(repository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(repository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<WatchAuthStatusUseCase>(
    () => WatchAuthStatusUseCase(repository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(repository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<CheckEmailVerifiedUseCase>(
    () => CheckEmailVerifiedUseCase(repository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<SendEmailVerificationUseCase>(
    () => SendEmailVerificationUseCase(repository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(repository: getIt<AuthRepository>()),
  );

  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      logoutUseCase: getIt<LogoutUseCase>(),
      watchAuthStatusUseCase: getIt<WatchAuthStatusUseCase>(),
      loginUseCase: getIt<LoginUseCase>(),
      registerUseCase: getIt<RegisterUseCase>(),
      checkEmailVerifiedUseCase: getIt<CheckEmailVerifiedUseCase>(),
      sendEmailVerificationUseCase: getIt<SendEmailVerificationUseCase>(),
      forgotPasswordUseCase: getIt<ForgotPasswordUseCase>(),
    ),
  );

  // ##################### End Auth ########################

  // #####################  Balance ########################
  getIt.registerLazySingleton<BalanceRemoteDataSource>(
    () => BalanceRemoteDataSource(getIt<FirebaseFirestore>()),
  );

  getIt.registerLazySingleton<BalanceRepository>(
    () => BalanceRepositoryImpl(getIt<BalanceRemoteDataSource>()),
  );

  getIt.registerFactory<BalanceCubit>(
    () => BalanceCubit(
      balanceRepository: getIt<BalanceRepository>(),
      secureStorageApi: getIt<SecureStorageApi>(),
    ),
  );

  // ##################### end Balance ########################

  //  ##################### Home ########################
  getIt.registerLazySingleton<CardCategoriesRemoteDataSource>(
    () => CardCategoriesRemoteDataSourceImpl(
      firestore: getIt<FirebaseFirestore>(),
    ),
  );
  getIt.registerLazySingleton<CardCategoriesRepository>(
    () => CardCategoriesRepositoryImpl(
      remoteDataSource: getIt<CardCategoriesRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<GetAllCategoriesUseCase>(
    () =>
        GetAllCategoriesUseCase(repository: getIt<CardCategoriesRepository>()),
  );
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(getAllCategories: getIt<GetAllCategoriesUseCase>()),
  );
  //  ##################### End Home ########################

  // ##################### Card Values ########################
  getIt.registerLazySingleton<CardValuesRemoteDataSource>(
    () => CardValuesRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<CardValuesRepository>(
    () => CardValuesRepositoryImpl(
      remoteDataSource: getIt<CardValuesRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<CardValuesUseCase>(
    () => CardValuesUseCase(repository: getIt<CardValuesRepository>()),
  );
  getIt.registerLazySingleton<UpdatePurchasePriceUseCase>(
    () => UpdatePurchasePriceUseCase(repository: getIt<CardValuesRepository>()),
  );
  getIt.registerFactory<CardValuesBloc>(
    () => CardValuesBloc(
      getValuesUseCase: getIt<CardValuesUseCase>(),
      updatePurchasePriceUseCase: getIt<UpdatePurchasePriceUseCase>(),
    ),
  );
  // ##################### End Card Values ########################
  // ##################### region  ########################
  getIt.registerLazySingleton<RegionRemoteDataSource>(
    () => RegionRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<RegionRepository>(
    () =>
        RegionRepositoryImpl(remoteDataSource: getIt<RegionRemoteDataSource>()),
  );
  getIt.registerLazySingleton<RegionUseCase>(
    () => RegionUseCase(repository: getIt<RegionRepository>()),
  );
  getIt.registerFactory<RegionBloc>(
    () => RegionBloc(getRegionsUseCase: getIt<RegionUseCase>()),
  );
  // ##################### End region ########################
  // ##################### Add Card  ########################
  getIt.registerLazySingleton<AddCardRemoteDataSource>(
    () => AddCardRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<AddCardRepository>(
    () => AddCardRepositoryImpl(
      remoteDataSource: getIt<AddCardRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<AddCardUseCase>(
    () => AddCardUseCase(repository: getIt<AddCardRepository>()),
  );
  getIt.registerFactory<AddCardBloc>(
    () => AddCardBloc(addCardUseCase: getIt<AddCardUseCase>()),
  );
  // ##################### End Add Card  ########################
  // ##################### buy Card  ########################
  getIt.registerLazySingleton<BuyCardRemoteDataSource>(
    () => BuyCardRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<BuyCardRepository>(
    () => BuyCardRepositoryImpl(
      remoteDataSource: getIt<BuyCardRemoteDataSource>(),
      storage: getIt<SecureStorageApi>(),
    ),
  );
  getIt.registerLazySingleton<BuyCardUseCase>(
    () => BuyCardUseCase(repository: getIt<BuyCardRepository>()),
  );
  getIt.registerFactory<BuyCardBloc>(
    () => BuyCardBloc(buyCardUseCase: getIt<BuyCardUseCase>()),
  );
  // ##################### End buy Card  ########################
  // ##################### User name  ########################
  getIt.registerFactory<UserNameCubit>(
    () => UserNameCubit(storage: getIt<SecureStorageApi>()),
  );

  // ##################### End User Name  ########################
  // ##################### purchase  ########################
  getIt.registerLazySingleton<PurchaseRemoteDataSource>(
    () => PurchaseRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<PurchaseRepository>(
    () => PurchaseRepositoryImpl(
      remoteDataSource: getIt<PurchaseRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<PurchaseUseCase>(
    () => PurchaseUseCase(repository: getIt<PurchaseRepository>()),
  );
  getIt.registerFactory<PurchaseBloc>(
    () => PurchaseBloc(getPurchasesUseCase: getIt<PurchaseUseCase>()),
  );
  // ##################### End purchase ########################
  // ##################### CardsInventory  ########################
  getIt.registerLazySingleton<CardsInventoryRemoteDataSource>(
    () => CardsInventoryRemoteDataSourceImpl(
      firestore: getIt<FirebaseFirestore>(),
    ),
  );
  getIt.registerLazySingleton<CardsInventoryRepository>(
    () => CardsInventoryRepositoryImpl(
      remoteDataSource: getIt<CardsInventoryRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<CardsInventoryUseCase>(
    () => CardsInventoryUseCase(repository: getIt<CardsInventoryRepository>()),
  );
  getIt.registerFactory<CardsInventoryBloc>(
    () => CardsInventoryBloc(
      getCardsInventoryUseCase: getIt<CardsInventoryUseCase>(),
    ),
  );
  // ##################### End CardsInventory ########################
  // ##################### Edit Card  ########################
  getIt.registerLazySingleton<EditCardRemoteDataSource>(
    () => EditCardRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<EditCardRepository>(
    () => EditCardRepositoryImpl(
      remoteDataSource: getIt<EditCardRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<EditCardUseCase>(
    () => EditCardUseCase(repository: getIt<EditCardRepository>()),
  );
  getIt.registerFactory<EditCardBloc>(
    () => EditCardBloc(editCardUseCase: getIt<EditCardUseCase>()),
  );
  // ##################### End Edit Card  ########################
  // ##################### Fetch Shops  ########################
  getIt.registerLazySingleton<FetchShopsRemoteDatasource>(
    () => FetchShopsRemoteDatasourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<FetchShopsRepository>(
    () => FetchShopsRepositoryImpl(
      remoteDataSource: getIt<FetchShopsRemoteDatasource>(),
    ),
  );
  getIt.registerLazySingleton<FetchShopsUseCase>(
    () => FetchShopsUseCase(repository: getIt<FetchShopsRepository>()),
  );
  getIt.registerFactory<ShopsBloc>(
    () => ShopsBloc(fetchShopsUseCase: getIt<FetchShopsUseCase>()),
  );
  // ##################### End Fetch Shops  ########################
  // ##################### Fetch Shops  ########################
  getIt.registerLazySingleton<AdjustBalanceRemoteDataSource>(
    () => AdjustBalanceRemoteDataSourceImpl(
      firestore: getIt<FirebaseFirestore>(),
    ),
  );
  getIt.registerLazySingleton<AdjustBalanceRepository>(
    () => AdjustBalanceRepositoryImpl(
      storage: getIt<SecureStorageApi>(),
      remote: getIt<AdjustBalanceRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<AdjustShopBalanceUseCase>(
    () =>
        AdjustShopBalanceUseCase(repository: getIt<AdjustBalanceRepository>()),
  );
  getIt.registerFactory(
    () => AdjustBalanceBloc(useCase: getIt<AdjustShopBalanceUseCase>()),
  );

  // ##################### End Fetch Shops  ########################
  // ##################### Transactions  ########################
  getIt.registerLazySingleton<TransactionsRemoteDataSource>(
    () =>
        TransactionsRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<TransactionsRepository>(
    () => TransactionsRepositoryImpl(
      remoteDataSource: getIt<TransactionsRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<TransactionsUseCase>(
    () => TransactionsUseCase(repository: getIt<TransactionsRepository>()),
  );
  getIt.registerFactory<TransactionsBloc>(
    () =>
        TransactionsBloc(getTransactionsUseCase: getIt<TransactionsUseCase>()),
  );
  // ##################### End Transactions ########################
}

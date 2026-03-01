import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';

import '../../../../../core/storage/secure_storage_api.dart';
import '../../../domain/repositories/balance_repository.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  final BalanceRepository balanceRepository;
  final SecureStorageApi secureStorageApi;

  StreamSubscription<int>? _subscription;

  BalanceCubit({
    required this.balanceRepository,
    required this.secureStorageApi,
  }) : super(const BalanceInitial());

  Future<void> start() async {
    emit(const BalanceLoading());

    final uid = await secureStorageApi.getUid();

    if (uid == null || uid.isEmpty) {
      emit(const BalanceError(''));
      return;
    }

    _subscription?.cancel();
    _subscription = balanceRepository
        .watchUserBalance(uid)
        .listen(
          (balance) {
            emit(BalanceLoaded(balance));
          },
          onError: (error) {
            emit(BalanceError(error.toString()));
          },
        );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

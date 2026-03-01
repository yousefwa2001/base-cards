part of 'shops_bloc.dart';

abstract class ShopsState extends Equatable {
  final List<UserEntity> shops;
  final String query;

  const ShopsState({required this.shops, this.query = ''});

  List<UserEntity> get filteredShops {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return shops;
    return shops.where((s) => s.name.toLowerCase().contains(q)).toList();
  }

  @override
  List<Object?> get props => [shops, query];
}

class ShopsInitial extends ShopsState {
  const ShopsInitial({required super.shops, super.query});
}

class ShopsLoading extends ShopsState {
  const ShopsLoading({required super.shops, super.query});
}

class ShopsSuccess extends ShopsState {
  const ShopsSuccess({required super.shops, super.query});
}

class ShopsFailure extends ShopsState {
  final String message;

  const ShopsFailure({
    required super.shops,
    required this.message,
    super.query,
  });

  @override
  List<Object?> get props => [message, shops, query];
}

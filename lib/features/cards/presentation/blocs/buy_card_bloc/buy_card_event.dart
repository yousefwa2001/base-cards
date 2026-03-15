part of 'buy_card_bloc.dart';

abstract class BuyCardEvent extends Equatable {
  const BuyCardEvent();
  @override
  List<Object?> get props => [];
}

class BuyCardRequested extends BuyCardEvent {
  const BuyCardRequested({

    required this.category,
    required this.region,
    required this.value,
  });


  final CardCategoryEntity category;
  final RegionEntity region;
  final CardValueEntity value;

  @override
  List<Object?> get props => [ category, region, value];
}

import 'package:equatable/equatable.dart';
import '../../../../core/enums/balance_direction.dart';

class BalanceEntity extends Equatable {
  final String id;
  final BalanceDirection direction;

  final String supplierId;
  final String supplierName;

  final String shopId;
  final String shopName;

  final int amount;


  final int supplierBalanceBefore;
  final int supplierBalanceAfter;
  final int shopBalanceBefore;
  final int shopBalanceAfter;

  final DateTime? at;
  final String? note;

  const BalanceEntity({
    required this.id,
    required this.direction,
    required this.supplierId,
    required this.supplierName,
    required this.shopId,
    required this.shopName,
    required this.amount,

    // ✅ before/after
    required this.supplierBalanceBefore,
    required this.supplierBalanceAfter,
    required this.shopBalanceBefore,
    required this.shopBalanceAfter,

    this.at,
    this.note,
  });

  @override
  List<Object?> get props => [
        id,
        direction,
        supplierId,
        supplierName,
        shopId,
        shopName,
        amount,

        // ✅ before/after
        supplierBalanceBefore,
        supplierBalanceAfter,
        shopBalanceBefore,
        shopBalanceAfter,

        at,
        note,
      ];
}

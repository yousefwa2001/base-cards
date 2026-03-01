import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/enums/balance_direction.dart';
import '../../domain/entities/balance_entity.dart';

class BalanceModel extends BalanceEntity {
  const BalanceModel({
    required super.id,
    required super.direction,
    required super.supplierId,
    required super.supplierName,
    required super.shopId,
    required super.shopName,
    required super.amount,

 
    required super.supplierBalanceBefore,
    required super.supplierBalanceAfter,
    required super.shopBalanceBefore,
    required super.shopBalanceAfter,

    super.at,
    super.note,
  });

  factory BalanceModel.fromFirestore(String id, Map<String, dynamic> data) {
    return BalanceModel(
      id: id,
      direction: BalanceDirectionX.fromString(
        (data['direction'] ?? 'credit').toString(),
      ),
      supplierId: (data['supplierId'] ?? '').toString(),
      supplierName: (data['supplierName'] ?? '').toString(),
      shopId: (data['shopId'] ?? '').toString(),
      shopName: (data['shopName'] ?? '').toString(),
      amount: (data['amount'] as num?)?.toInt() ?? 0,

     
      supplierBalanceBefore:
          (data['supplierBalanceBefore'] as num?)?.toInt() ?? 0,
      supplierBalanceAfter:
          (data['supplierBalanceAfter'] as num?)?.toInt() ?? 0,
      shopBalanceBefore: (data['shopBalanceBefore'] as num?)?.toInt() ?? 0,
      shopBalanceAfter: (data['shopBalanceAfter'] as num?)?.toInt() ?? 0,

      at: data['at'] != null ? (data['at'] as Timestamp).toDate() : null,
      note: data['note']?.toString(),
    );
  }

  Map<String, dynamic> toMapForCreate() {
    final map = <String, dynamic>{
      'type': 'balance_adjustment',
      'direction': direction.value,
      'supplierId': supplierId,
      'supplierName': supplierName,
      'shopId': shopId,
      'shopName': shopName,
      'amount': amount,

      'supplierBalanceBefore': supplierBalanceBefore,
      'supplierBalanceAfter': supplierBalanceAfter,
      'shopBalanceBefore': shopBalanceBefore,
      'shopBalanceAfter': shopBalanceAfter,

      'at': FieldValue.serverTimestamp(),
    };

    final n = note?.trim();
    if (n != null && n.isNotEmpty) {
      map['note'] = n;
    }

    return map;
  }
}

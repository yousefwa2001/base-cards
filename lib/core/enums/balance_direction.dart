enum BalanceDirection { credit, debit }

extension BalanceDirectionX on BalanceDirection {
  String get value => this == BalanceDirection.credit ? 'credit' : 'debit';

  static BalanceDirection fromString(String v) {
    return v == 'debit' ? BalanceDirection.debit : BalanceDirection.credit;
  }
}

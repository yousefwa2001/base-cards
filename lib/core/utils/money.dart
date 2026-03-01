class Money {
  static const int decimals = 2;
  static int get factor => 100;

  static int toMinor(double major) => (major * factor).round();
  static double toMajor(int minor) => minor / factor;

  static int parseToMinor(String input) {
    final normalized = input.trim().replaceAll(',', '.');
    final v = double.tryParse(normalized) ?? 0.0;
    return toMinor(v);
  }
}

extension DateTimeFormatX on DateTime {
  String toYmdHm() {
    final hh = hour.toString().padLeft(2, '0');
    final mm = minute.toString().padLeft(2, '0');

    final y = year.toString();
    final m = month.toString().padLeft(2, '0');
    final d = day.toString().padLeft(2, '0');

    return "$y-$m-$d  $hh:$mm";
  }
}

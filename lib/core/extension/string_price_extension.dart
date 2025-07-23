extension StringPriceExtension on String {
  String truncateTo2Decimals() {
    final dotIndex = indexOf('.');
    if (dotIndex == -1) return this; // нет точки — возвращаем как есть

    final end = (dotIndex + 3 <= length) ? dotIndex + 3 : length;
    return substring(0, end);
  }
}

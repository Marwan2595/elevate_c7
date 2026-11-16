class Utils {
  static String formatPrice(double price) => price == price.truncateToDouble()
      ? price.toStringAsFixed(0)
      : price.toStringAsFixed(2);
}

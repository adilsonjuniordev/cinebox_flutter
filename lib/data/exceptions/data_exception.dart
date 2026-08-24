class DataException implements Exception {
  final String message;

  new({required this.message});

  @override
  String toString() {
    return 'DataException: $message';
  }
}

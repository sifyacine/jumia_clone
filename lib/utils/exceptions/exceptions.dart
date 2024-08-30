class TFirebaseAuthException implements Exception {
  final String message;
  TFirebaseAuthException(this.message);

  @override
  String toString() => 'TFirebaseAuthException: $message';
}

class TFirebaseException implements Exception {
  final String message;
  TFirebaseException(this.message);

  @override
  String toString() => 'TFirebaseException: $message';
}

class TFormatException implements Exception {
  final String message;
  TFormatException(this.message);

  @override
  String toString() => 'TFormatException: $message';
}

class TPlatformException implements Exception {
  final String message;
  TPlatformException(this.message);

  @override
  String toString() => 'TPlatformException: $message';
}

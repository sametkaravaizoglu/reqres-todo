class ValidatorManager {
  static var defaultEmptyCheckValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Bu alanın doldurulması zorunludur.';
    }
    return null;
  };
}

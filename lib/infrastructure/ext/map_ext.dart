extension MapExtension<Key, Value> on Map<Key, Value> {
  ///
  /// Get An Item from Map with a specific key. If There is no item with the given key
  /// that the function will return `null`
  ///
  Value? getOrNull(Key key) {
    if (!containsKey(key)) return null;
    if (this[key] is Value) return this[key];
    return null;
  }

  /// Get An Item from Map with a specific key. If There is no item with the given key
  /// that the function will return `null`
  ///
  /// IF The value is not null that the function will map the value using the mapper function
  ///
  Result? getAndMapOrNull<Result>(
      Key key, Result Function(Value expected) mapper) {
    if (!containsKey(key)) return null;
    final value = this[key];
    if (value is Value) return mapper(value);
    return null;
  }
}

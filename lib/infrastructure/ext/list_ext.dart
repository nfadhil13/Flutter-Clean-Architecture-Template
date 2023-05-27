extension ListExtension<E> on List<E> {
  int get lastIndex => length - 1;

  bool isLastIndex(int index) => index == lastIndex;

  List<T> mapIndexed<T>(T Function(int index, E item) mapper) {
    return List.generate(length, (index) => mapper(index, this[index]));
  }

  E? getAtOrNull(int index) {
    if (index < length && index >= 0) return this[index];
    return null;
  }

  List<T> whereMap<T>(
      T Function(E item) mapper, bool Function(E item) condition) {
    final List<T> result = [];
    forEach((element) {
      if (condition(element)) {
        result.add(mapper(element));
      }
    });
    return result;
  }

  List<T> whereMapIndexed<T>(T Function(int index, E item) mapper,
      bool Function(int index, E item) condition) {
    final List<T> result = [];
    for (var i = 0; i < length; i++) {
      final element = this[i];
      if (condition(i, element)) {
        result.add(mapper(i, element));
      }
    }
    return result;
  }

  E? firstWhereOrNull<T>(bool Function(int index, E item) condition) {
    for (var i = 0; i < length; i++) {
      final element = this[i];
      if (condition(i, element)) return element;
    }
    return null;
  }

  Map<Key, Value> toMap<Key, Value>(
      MapEntry<Key, Value> Function(E item) mapper) {
    final Map<Key, Value> result = {};
    for (var element in this) {
      final mapped = mapper(element);
      result[mapped.key] = mapped.value;
    }
    return result;
  }
}

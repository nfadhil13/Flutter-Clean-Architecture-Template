abstract class ToJSONMapper<T> {
  final T data;

  ToJSONMapper(this.data);

  dynamic toJSON();
}

abstract class FromJSONMapper<T> {
  T toModel(dynamic json);
}

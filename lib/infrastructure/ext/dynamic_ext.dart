extension DynamicExt<T extends dynamic> on T {
  Y let<Y>(Y Function(T value) fun) => fun(this);

  run<Y>(void Function(T value) fun) => fun(this);
}

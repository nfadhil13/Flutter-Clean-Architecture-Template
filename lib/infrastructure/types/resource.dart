import 'package:uf_profielder_mobile/infrastructure/types/exceptions/base_exception.dart';

sealed class Resource<T> {
  static Resource<T> success<T>(T data) => Success<T>(data: data);

  static Resource<T> error<T>(BaseException exception) => Error<T>(exception);
}

double test<T>(Resource<T> resource) =>
    switch (resource) { Success() => 1, Error() => 2 };

class Success<T> extends Resource<T> {
  final T data;

  Success({required this.data});
}

class Error<T> extends Resource<T> {
  final BaseException exception;

  Error(this.exception);
}

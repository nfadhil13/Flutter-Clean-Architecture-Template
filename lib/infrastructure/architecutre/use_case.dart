import 'package:flutter/material.dart';
import 'package:uf_profielder_mobile/infrastructure/types/exceptions/base_exception.dart';
import 'package:uf_profielder_mobile/infrastructure/types/resource.dart';

///
/// ```dart
/// class TestUseCase extends Usecase<NoParams, int> {
///  @override
///  Future<Resource<int>> execute(NoParams params) async {
///    await Future.delayed(const Duration(seconds: 5));
///    return Resource.success(1, "");
///  }
/// }
/// ```
///
///
abstract class Usecase<Params, Result> {
  Future<Resource<Result>> execute(Params params);

  Future<Resource<Result>> call(Params params) async {
    try {
      final result = await execute(params);
      return result;
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrint(stacktrace.toString());
      return await handleError(e, stacktrace);
    }
  }

  Future<Resource<Result>> handleError(Object e, StackTrace stackTrace) async {
    if (e is! BaseException) {
      return Resource.error<Result>(BaseException.unknownError());
    }

    return Resource.error(e);
  }
}

abstract class UsecaseNoParams<Result> {
  Future<Resource<Result>> execute();

  Future<Resource<Result>> call() async {
    try {
      final result = await execute();
      return result;
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrint(stacktrace.toString());
      return await handleError(e, stacktrace);
    }
  }

  Future<Resource<Result>> handleError(Object e, StackTrace stackTrace) async {
    if (e is! BaseException) {
      return Resource.error<Result>(BaseException.unknownError());
    }

    return Resource.error(e);
  }
}

extension DataToResouceExt<T extends dynamic> on Future<T> {
  Future<Resource<T>> get asResource async => Resource.success(await this);
}

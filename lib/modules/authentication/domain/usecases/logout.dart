import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:uf_profielder_mobile/infrastructure/architecutre/use_case.dart';
import 'package:uf_profielder_mobile/infrastructure/types/nothing.dart';
import 'package:uf_profielder_mobile/infrastructure/types/resource.dart';
import 'package:uf_profielder_mobile/modules/authentication/domain/repositories/authentication_repo.dart';

@injectable
class Logout extends UsecaseNoParams<Nothing> {
  final AuthenticationRepo _authRepo;

  Logout(this._authRepo);

  @override
  Future<Resource<Nothing>> execute() async {
    await _authRepo.logout();
    return Resource.success(const Nothing());
  }
}

import 'package:injectable/injectable.dart';
import 'package:uf_profielder_mobile/infrastructure/local_storage/secure_storage/secure_storage.dart';
import 'package:uf_profielder_mobile/modules/authentication/data/mapper/local/session_local_mapper.dart';
import 'package:uf_profielder_mobile/modules/authentication/domain/model/user_session.dart';

abstract class AuthenticationLocalDTS {
  Future<void> putSession(UserSession session);
  Future<void> clearSession();
  Future<UserSession?> getLastSession();
}

@Injectable(as: AuthenticationLocalDTS)
class AuthLocalDTSImpl implements AuthenticationLocalDTS {
  final SecureStorage _secureStorage;
  final SessionLocalMapper _sessionLocalMapper = SessionLocalMapper();

  final _userSessionKey =
      "uf.profielder.mobile.lib.modules.authentication.data.datasource.local.authentication_local_dts.dart";

  AuthLocalDTSImpl(this._secureStorage);

  @override
  Future<void> putSession(UserSession session) => _secureStorage.writeJSON(
      key: _userSessionKey, json: _sessionLocalMapper.toEntity(session));

  @override
  Future<void> clearSession() => _secureStorage.remove(_userSessionKey);

  @override
  Future<UserSession?> getLastSession() => _secureStorage
      .readData(_sessionLocalMapper.toDomain, key: _userSessionKey);
}

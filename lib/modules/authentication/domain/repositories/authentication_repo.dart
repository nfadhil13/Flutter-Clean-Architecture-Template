import 'package:uf_profielder_mobile/modules/authentication/domain/model/user_session.dart';

abstract class AuthenticationRepo {
  Future<UserSession> login(
      {required String username, required String password});
  Future<UserSession?> getLastLoggedInUser();
  Future<void> logout();
}

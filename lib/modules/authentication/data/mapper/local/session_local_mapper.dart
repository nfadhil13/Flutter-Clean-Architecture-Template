import 'package:uf_profielder_mobile/infrastructure/architecutre/local_mapper.dart';
import 'package:uf_profielder_mobile/modules/authentication/domain/model/user_session.dart';
import 'package:uf_profielder_mobile/modules/user/domain/models/user.dart';

class SessionLocalMapper extends LocalMapper<UserSession, dynamic> {
  SessionLocalMapper();

  @override
  UserSession toDomain(entity) {
    final userJSON = entity["user"];
    return UserSession(
      token: entity["token"],
      expiredTime: DateTime.parse(entity["expiredTime"]),
      user: User(
        id: userJSON['id'],
        userName: userJSON['userName'],
        companyId: userJSON['companyId'],
        companyName: userJSON['companyName'],
        companyStates: List<String>.from(userJSON['companyStates']),
        roles: List<String>.from(userJSON['roles']),
      ),
    );
  }

  @override
  toEntity(UserSession domain) {
    return {
      "token": domain.token,
      "expiredTime": domain.expiredTime.toString(),
      "user": {
        'id': domain.user.id,
        'userName': domain.user.userName,
        'companyId': domain.user.companyId,
        'companyName': domain.user.companyName,
        'companyStates': domain.user.companyStates,
        'roles': domain.user.roles,
      }
    };
  }
}

import 'package:uf_profielder_mobile/infrastructure/types/mapper/json_mapper.dart';
import 'package:uf_profielder_mobile/modules/authentication/domain/model/user_session.dart';
import 'package:uf_profielder_mobile/modules/user/domain/models/user.dart';

class UserSessionRemoteResMapper implements FromJSONMapper<UserSession> {
  @override
  UserSession toModel(json) {
    final userJSON = json["user"];
    return UserSession(
      token: json["token"],
      user: User(
        id: userJSON['id'],
        userName: userJSON['userName'],
        companyId: userJSON['companyId'],
        companyName: userJSON['companyName'],
        companyStates: List<String>.from(userJSON['companyStates']),
        roles: List<String>.from(userJSON['roles']),
      ),
      expiredTime: DateTime.parse(json["expiredTime"]),
    );
  }
}

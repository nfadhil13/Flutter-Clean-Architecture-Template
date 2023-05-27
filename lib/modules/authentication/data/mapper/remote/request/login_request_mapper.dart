import 'package:uf_profielder_mobile/infrastructure/types/mapper/json_mapper.dart';

class LoginRemoteReqMapper
    extends ToJSONMapper<({String username, String password})> {
  LoginRemoteReqMapper(super.data);

  @override
  toJSON() {
    return {
      "password": data.password,
      "userName": data.username,
      "timeOffset": 0,
      "rememberMe": true
    };
  }
}

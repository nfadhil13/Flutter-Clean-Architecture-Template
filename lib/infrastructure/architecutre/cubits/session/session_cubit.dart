import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:uf_profielder_mobile/modules/authentication/domain/model/user_session.dart';
import 'package:uf_profielder_mobile/modules/authentication/domain/usecases/logout.dart';

part 'session_state.dart';

@lazySingleton
class SessionCubit extends Cubit<SessionState> {
  final Logout _logout;
  SessionCubit(this._logout) : super(const SessionIdle(null));

  void setCurrenetUser(UserSession? user) {
    emit(SessionIdle(user));
  }

  void logOut() async {
    print("Logout");
    await _logout();
    emit(const SessionLogout(null));
  }
}

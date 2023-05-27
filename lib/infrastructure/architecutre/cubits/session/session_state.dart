part of 'session_cubit.dart';

abstract class SessionState extends Equatable {
  final UserSession? session;
  const SessionState(this.session);

  @override
  List<Object?> get props => [session];
}

class SessionIdle extends SessionState {
  const SessionIdle(super.session);
}

class SessionLogout extends SessionState {
  const SessionLogout(super.session);
}

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String userName;
  final String companyId;
  final String companyName;
  final List<String> companyStates;
  final List<String> roles;

  const User({
    required this.id,
    required this.userName,
    required this.companyId,
    required this.companyName,
    required this.companyStates,
    required this.roles,
  });

  @override
  List<Object?> get props =>
      [id, userName, companyId, companyName, companyStates, roles];
}

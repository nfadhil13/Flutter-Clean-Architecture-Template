import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uf_profielder_mobile/infrastructure/architecutre/cubits/session/session_cubit.dart';
import 'package:uf_profielder_mobile/infrastructure/routing/router.gr.dart';
import 'package:uf_profielder_mobile/infrastructure/service_locator/service_locator.dart';
import 'package:uf_profielder_mobile/modules/authentication/domain/usecases/logout.dart';

class AuthenticatedWrapper extends StatelessWidget {
  final Widget child;
  const AuthenticatedWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionCubit, SessionState>(
      listener: (context, state) {
        print(state);
        if (state is SessionLogout) {
          context.router.replaceAll([const LoginRoute()]);
        }
      },
      child: child,
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uf_profielder_mobile/infrastructure/ext/ctx_ext.dart';
import 'package:uf_profielder_mobile/infrastructure/widgets/buttons/elevated_button.dart';
import 'package:uf_profielder_mobile/modules/authentication/presentation/widgets/logged_in_wrapper.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthenticatedWrapper(child: _HomeScreenContent());
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Current user name : ${context.userSession.user.userName}"),
          UFElevatedButton(
              label: "Logout",
              onPressed: () {
                context.logout();
              })
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uf_profielder_mobile/infrastructure/architecutre/cubits/messenger/messenger_cubit.dart';
import 'package:uf_profielder_mobile/infrastructure/architecutre/cubits/session/session_cubit.dart';
import 'package:uf_profielder_mobile/infrastructure/architecutre/error_handler/global_errror_catcher.dart';
import 'package:uf_profielder_mobile/infrastructure/ext/ctx_ext.dart';
import 'package:uf_profielder_mobile/infrastructure/routing/router.dart';
import 'package:uf_profielder_mobile/infrastructure/service_locator/service_locator.dart';
import 'package:uf_profielder_mobile/infrastructure/styles/color.dart';

class UFProfielderApp extends StatelessWidget {
  final AppRouter appRouter;
  const UFProfielderApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MessengerCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SessionCubit>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.delegate(),
        builder: (context, child) {
          return GlobalErrorCatcher(
            child: UFMessengerListener(
              child: child,
            ),
            onSessionExpire: () {
              context.messenger.showErrorSnackbar("Session Expired");
              context.logout();
            },
          );
        },
        routeInformationParser: appRouter.defaultRouteParser(),
        theme: ThemeData(
          colorScheme: UFTheme.lightScheme,
        ),
      ),
    );
  }
}

class UFMessengerListener extends StatelessWidget {
  final Widget? child;
  const UFMessengerListener({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessengerCubit, MessengerState>(
      listener: (context, state) {
        if (state is MessengerIdle) return;
        if (state is MessengerSnackbar) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: state.backgroundColor(context),
          ));
        }
        context.read<MessengerCubit>().idle();
      },
      child: child,
    );
  }
}

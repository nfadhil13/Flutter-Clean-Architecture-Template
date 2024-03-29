import 'package:flutter/material.dart';
import 'package:uf_profielder_mobile/app.dart';
import 'package:uf_profielder_mobile/infrastructure/architecutre/error_handler/global_error_handler.dart';
import 'package:uf_profielder_mobile/infrastructure/env/env.dart';
import 'package:uf_profielder_mobile/infrastructure/routing/router.dart';
import 'package:uf_profielder_mobile/infrastructure/service_locator/service_locator.dart';

void main() async {
  await configureDependencies();
  UFGlobalErrorHandler.setUpErrorHandler();
  ENV.setEnv(ENV.dev);
  runApp(UFProfielderApp(
    appRouter: AppRouter(),
  ));
}

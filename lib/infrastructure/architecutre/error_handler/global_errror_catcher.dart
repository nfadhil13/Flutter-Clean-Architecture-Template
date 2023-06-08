import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uf_profielder_mobile/infrastructure/architecutre/cubits/messenger/messenger_cubit.dart';
import 'package:uf_profielder_mobile/infrastructure/architecutre/error_handler/global_error_handler.dart';
import 'package:uf_profielder_mobile/infrastructure/ext/ctx_ext.dart';

class GlobalErrorCatcher extends StatefulWidget {
  final Widget? child;
  final Function()? onSessionExpire;
  const GlobalErrorCatcher({
    super.key,
    required this.child,
    this.onSessionExpire,
  });

  @override
  State<GlobalErrorCatcher> createState() => _GlobalErrorCatcherState();
}

class _GlobalErrorCatcherState extends State<GlobalErrorCatcher> {
  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(
        _port.sendPort, UFGlobalErrorHandler.sessionTimeoutPortName);
    _port.listen((message) {
      if (message) widget.onSessionExpire?.call();
    });
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping(
        UFGlobalErrorHandler.sessionTimeoutPortName);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

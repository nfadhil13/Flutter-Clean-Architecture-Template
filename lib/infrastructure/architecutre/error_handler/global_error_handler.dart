import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uf_profielder_mobile/infrastructure/types/exceptions/session_exception.dart';

class UFGlobalErrorHandler {
  static const sessionTimeoutPortName = "session_port";

  static void _handleSessionTimeOut() {
    final SendPort? send =
        IsolateNameServer.lookupPortByName(sessionTimeoutPortName);
    send?.send(true);
  }

  static void setUpErrorHandler() {
    final defaultErrorHandler = FlutterError.onError;
    final platformError = PlatformDispatcher.instance.onError;
    PlatformDispatcher.instance.onError = (error, stack) {
      final exception = error;
      if (exception is SessionException) _handleSessionTimeOut();
      return platformError?.call(error, stack) ?? true;
    };
    FlutterError.onError = (details) {
      final exception = details.exception;
      if (exception is SessionException) _handleSessionTimeOut();
      defaultErrorHandler?.call(details);
    };
  }
}

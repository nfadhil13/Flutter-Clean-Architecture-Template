import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'messenger_state.dart';

@lazySingleton
class MessengerCubit extends Cubit<MessengerState> {
  MessengerCubit() : super(MessengerIdle());

  void idle() {
    emit(MessengerIdle());
  }

  void showSuccessSnackbar(String message,
      {Duration duration = const Duration(seconds: 1)}) {
    showSnackbar(
        message: message,
        backgroundColor: (context) => Colors.green,
        duration: duration,
        textColor: (context) => Colors.white);
  }

  void showErrorSnackbar(String message,
      {Duration duration = const Duration(seconds: 1)}) {
    showSnackbar(
        message: message,
        backgroundColor: (context) => Colors.red,
        duration: duration,
        textColor: (context) => Colors.white);
  }

  void showSnackbar(
      {required String message,
      required BuildWithContext<Color> backgroundColor,
      required Duration duration,
      required BuildWithContext<Color> textColor}) {
    emit(MessengerSnackbar(
        message: message,
        backgroundColor: backgroundColor,
        duration: duration,
        textColor: textColor));
  }
}

extension MessageExt on BuildContext {
  MessengerCubit get messenger => read<MessengerCubit>();
}

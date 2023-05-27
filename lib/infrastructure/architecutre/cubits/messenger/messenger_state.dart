part of 'messenger_cubit.dart';

typedef BuildWithContext<T> = T Function(BuildContext context);

abstract class MessengerState extends Equatable {
  const MessengerState();

  @override
  List<Object> get props => [];
}

class MessengerIdle extends MessengerState {}

class MessengerSnackbar extends MessengerState {
  final String message;
  final BuildWithContext<Color> backgroundColor;
  final BuildWithContext<Color> textColor;
  final Duration duration;

  const MessengerSnackbar(
      {required this.message,
      required this.backgroundColor,
      required this.duration,
      required this.textColor});
}

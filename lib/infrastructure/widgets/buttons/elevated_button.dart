import 'package:flutter/material.dart';
import 'package:uf_profielder_mobile/infrastructure/ext/ctx_ext.dart';

class UFElevatedButton extends StatelessWidget {
  final String label;
  final bool fillParent;
  final VoidCallback? onPressed;
  const UFElevatedButton(
      {super.key,
      required this.label,
      this.onPressed,
      this.fillParent = false});

  Widget buildButton(BuildContext context) {
    final style = Theme.of(context).elevatedButtonTheme.style ??
        ElevatedButton.styleFrom();

    return ElevatedButton(
        onPressed: onPressed,
        style: style.copyWith(
            textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 18)),
            padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(200)))),
        child: Text(
          label,
          textAlign: TextAlign.center,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final button = buildButton(context);
    return fillParent
        ? SizedBox(
            width: double.infinity,
            child: button,
          )
        : button;
  }
}

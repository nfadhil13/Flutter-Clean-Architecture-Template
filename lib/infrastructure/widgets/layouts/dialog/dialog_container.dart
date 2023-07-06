import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uf_profielder_mobile/infrastructure/ext/ctx_ext.dart';
import 'package:uf_profielder_mobile/infrastructure/ext/double_ext.dart';

part 'confirmation_dialog.dart';
part 'information_dialog.dart';

class DialogContainer extends StatelessWidget {
  final double maxHeightPercentage;
  final Widget child;
  const DialogContainer(
      {super.key, required this.maxHeightPercentage, required this.child});

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.color;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .05, vertical: 0),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: size.height * maxHeightPercentage, minHeight: 0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: colorTheme.surface,
                    borderRadius: BorderRadius.circular(12)),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

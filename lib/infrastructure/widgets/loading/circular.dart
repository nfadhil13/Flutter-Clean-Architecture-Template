import 'package:flutter/cupertino.dart';
import 'package:uf_profielder_mobile/infrastructure/ext/ctx_ext.dart';

class UFCircularLoading extends StatelessWidget {
  final Color? color;
  final double? radius;
  const UFCircularLoading({super.key, this.color, this.radius});

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: radius ?? 20,
      color: color ?? context.color.primary,
    );
  }
}

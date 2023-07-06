part of 'dialog_container.dart';

class InformationDialog extends StatelessWidget {
  final void Function(VoidCallback closeDialog)? onConfirm;
  final double? maxHeightPercentage;
  final String? title;
  final String? desc;
  final Widget? descWidget;

  const InformationDialog._(
      {required this.onConfirm,
      this.title,
      this.desc,
      this.descWidget,
      this.maxHeightPercentage});

  static Future<void> launch(BuildContext context,
      {void Function(VoidCallback closeDialog)? onConfirm,
      double? maxHeightPercentage,
      String? title,
      Widget? descWidget,
      String? desc}) async {
    showDialog(
        context: context,
        builder: (context) => InformationDialog._(
              onConfirm: onConfirm,
              maxHeightPercentage: maxHeightPercentage,
              desc: desc,
              descWidget: descWidget,
              title: title,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
        maxHeightPercentage: maxHeightPercentage ?? .5,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: context.text.headlineSmall,
                  ),
                const SizedBox(height: 5),
                if (descWidget != null) descWidget!,
                if (desc != null && descWidget == null)
                  Text(
                    desc!,
                    textAlign: TextAlign.start,
                    style: context.text.bodyMedium
                        ?.copyWith(color: context.color.onSurfaceVariant),
                  ),
                12.verticalSpace,
                InkWell(
                  onTap: () {
                    final onConfirm = this.onConfirm;
                    if (onConfirm == null) {
                      context.router.root.pop();
                      return;
                    }
                    onConfirm(() => context.router.pop());
                  },
                  child: Column(
                    children: [
                      12.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Ya",
                            style: context.text.labelLarge
                                ?.copyWith(color: context.color.primary),
                          ),
                          12.horizontalSpace
                        ],
                      ),
                      12.verticalSpace
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

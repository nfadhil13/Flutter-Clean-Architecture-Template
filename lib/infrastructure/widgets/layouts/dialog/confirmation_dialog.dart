part of 'dialog_container.dart';

// class ConfirmationDialog extends StatelessWidget {
//   final Function(VoidCallback closeDialog) onConfirm;
//   final VoidCallback? onCancel;
//   final String? title;
//   final String? desc;

//   const ConfirmationDialog._(
//       {required this.onConfirm, this.onCancel, this.title, this.desc});

//   static Future<void> launch(BuildContext context,
//       {required Function(VoidCallback closeDialog) onConfirm,
//       VoidCallback? onCancel,
//       String? title,
//       String? desc}) async {
//     showDialog(
//         context: context,
//         builder: (context) => ConfirmationDialog._(
//               onConfirm: onConfirm,
//               onCancel: onCancel,
//               desc: desc,
//               title: title,
//             ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DialogContainer(
//         maxHeightPercentage: .5,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Icon(
//                   Icons.warning_amber,
//                   size: 84,
//                   color: Colors.orange,
//                 ),
//                 const SizedBox(height: 20),
//                 if (title != null)
//                   Text(
//                     title!,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 24),
//                   ),
//                 const SizedBox(height: 5),
//                 if (desc != null)
//                   Text(
//                     desc!,
//                     textAlign: TextAlign.center,
//                   ),
//                 const SizedBox(height: 45),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: UFOutlinedButton(
//                           color: context.colorTheme.primaryColor,
//                           onPressed: () {
//                             if (onCancel != null) {
//                               onCancel?.call();
//                             } else {
//                               Navigator.of(context).pop();
//                             }
//                           },
//                           text: "Tidak"),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: PrimaryButton(
//                         onPressed: () => onConfirm(() {
//                           Navigator.of(context).pop();
//                         }),
//                         text: "Ya",
//                         backgroundColor: context.colorTheme.primaryColor,
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }

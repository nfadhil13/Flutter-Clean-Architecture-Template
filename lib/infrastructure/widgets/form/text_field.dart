import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uf_profielder_mobile/infrastructure/ext/ctx_ext.dart';

class UFTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? desc;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final int minLine;
  final int maxLine;
  final bool readOnly;
  final String? initialValue;
  final bool filled;
  final Color? backgroundColor;
  final Function(String value)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final EdgeInsets? contentPadding;
  final bool? enabled;
  final FocusNode? focusNode;
  final bool? autofocus;
  final BorderRadius borderRadius;

  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;

  UFTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.focusNode,
    this.minLine = 1,
    this.autofocus,
    this.maxLine = 1,
    this.label = '',
    this.enabled,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.prefixIcon,
    this.inputType,
    this.desc,
    this.readOnly = false,
    this.backgroundColor,
    this.filled = false,
    this.onFieldSubmitted,
    this.textInputAction,
    this.initialValue,
    this.contentPadding,
    this.inputFormatters,
    this.onTap,
  })  : borderRadius = BorderRadius.circular(8),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = context.color;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(visible: label.isNotEmpty, child: Text(label)),
        if (label.isNotEmpty) const SizedBox(height: 5.0),
        TextFormField(
          autofocus: autofocus ?? false,
          focusNode: focusNode,
          enabled: enabled ?? true,
          minLines: minLine,
          maxLines: maxLine,
          initialValue: initialValue,
          readOnly: readOnly,
          obscureText: obscureText ?? false,
          validator: validator,
          controller: controller,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            fillColor: color.onError,
            filled: true,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(width: 1, color: color.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(width: 1, color: color.error),
            ),
            hintText: hintText,
            // hintStyle: const TextStyle(
            //     fontSize: 14, color: color.),
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(width: 1, color: color.primary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(width: 1, color: color.surfaceVariant),
            ),
          ),
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: inputType,
          onTap: onTap,
        ),
        if (desc != null) const SizedBox(height: 5.0),
        if (desc != null)
          Text(
            desc!,
            style: TextStyle(color: color.surfaceVariant),
          ),
      ],
    );
  }
}

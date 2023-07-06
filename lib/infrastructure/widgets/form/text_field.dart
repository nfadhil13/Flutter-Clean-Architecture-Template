import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uf_profielder_mobile/infrastructure/ext/ctx_ext.dart';
import 'package:sizer/sizer.dart';

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
    final text = context.text;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          style: text.bodyLarge?.copyWith(fontWeight: FontWeight.normal),
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            labelText: label,
            suffixIconColor: context.color.outline,
            errorStyle: context.text.bodySmall
                ?.copyWith(color: color.error, fontSize: 10.sp),
            labelStyle: text.bodySmall,
            alignLabelWithHint: false,
            errorMaxLines: 3,
            errorBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: color.error)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: color.error)),
            focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: color.primary)),
            enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: color.outline)),
            hintText: hintText,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
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

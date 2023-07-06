import 'package:flutter/material.dart';
import 'package:uf_profielder_mobile/infrastructure/ext/ctx_ext.dart';
import 'package:sizer/sizer.dart';

class UFDropdown<T> extends StatefulWidget {
  final List<(String label, T data)> choices;
  final T? initialValue;
  final UFDropdownController? controller;
  final String label;
  final String? hintText;
  final String? desc;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(T?)? validator;
  final TextInputType? inputType;
  final int minLine;
  final int maxLine;
  final bool readOnly;
  final bool filled;
  final Color? backgroundColor;
  final Function(String value)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final EdgeInsets? contentPadding;
  final bool? enabled;
  final FocusNode? focusNode;
  final bool? autofocus;
  final BorderRadius borderRadius;

  UFDropdown({
    super.key,
    required this.choices,
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
    this.contentPadding,
    this.initialValue,
  }) : borderRadius = BorderRadius.circular(8);

  @override
  State<UFDropdown<T>> createState() => _UFDropdownState<T>();
}

class UFDropdownController<T> {
  _UFDropdownState<T>? _state;
  UFDropdownController();

  _init(_UFDropdownState<T>? state) {
    _state = state;
  }

  dispose() {
    _state = null;
  }

  T? get value => _state?._value;
}

class _UFDropdownState<T> extends State<UFDropdown<T>> {
  T? _value;

  @override
  void initState() {
    super.initState();
    widget.controller?._init(this);
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final color = context.color;
    final text = context.text;
    return DropdownButtonFormField<T>(
        items: widget.choices
            .map((e) => DropdownMenuItem(
                  value: e.$2,
                  child: Text(
                    e.$1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        isExpanded: true,
        value: _value,
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          labelText: widget.label,
          suffixIconColor: context.color.outline,
          errorStyle: context.text.bodySmall
              ?.copyWith(color: color.error, fontSize: 10.sp),
          labelStyle: text.bodySmall,
          alignLabelWithHint: false,
          errorMaxLines: 3,
          errorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: BorderSide(color: color.error)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: BorderSide(color: color.error)),
          focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: BorderSide(color: color.primary)),
          enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: BorderSide(color: color.outline)),
          hintText: widget.hintText,
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        ),
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        });
  }
}

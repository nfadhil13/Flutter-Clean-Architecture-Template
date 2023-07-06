import 'package:flutter/material.dart';
import 'package:uf_profielder_mobile/infrastructure/utils/value_validator/form_validator.dart';
import 'package:uf_profielder_mobile/infrastructure/widgets/form/text_field.dart';

class UFPasswordField extends StatefulWidget {
  final ValueValidator<String?> validator;
  final String label;
  final TextEditingController controller;
  const UFPasswordField(
      {super.key,
      required this.validator,
      required this.label,
      required this.controller});

  @override
  State<UFPasswordField> createState() => _UFPasswordFieldState();
}

class _UFPasswordFieldState extends State<UFPasswordField> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return UFTextField(
      obscureText: _isPasswordHidden,
      suffixIcon: InkWell(
        onTap: () => setState(() {
          _isPasswordHidden = !_isPasswordHidden;
        }),
        child: Icon(
          _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
        ),
      ),
      validator: widget.validator,
      controller: widget.controller,
      label: widget.label,
    );
  }
}

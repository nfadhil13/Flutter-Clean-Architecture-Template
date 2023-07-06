part of 'form_validator.dart';

// Class untuk melakukan validasi email
class EmailValidatorBuilder extends ValueValidatorBuilder<String?> {
  static String? _emailValidator(String? value) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
    return emailValid ? null : "Format email tidak valid";
  }

  EmailValidatorBuilder.create(String fieldname)
      : super._(fieldname, [
          ...ValueValidatorBuilder.create(fieldname)
              .notNull()
              .notEmpty()
              .validatorList,
          _emailValidator
        ]);
}

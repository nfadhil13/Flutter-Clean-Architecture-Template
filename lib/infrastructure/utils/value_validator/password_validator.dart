part of 'form_validator.dart';

/// Class untuk melakukan validasi password
class PasswordValidator extends ValueValidatorBuilder<String?> {
  /// Melakukan validasi password minimal memiliki satu huruf kapital
  static String? _containUpperCase(String? value) =>
      value!.contains(RegExp(r'[A-Z]'))
          ? null
          : "Password harus memiliki minimal satu huruf kapital [A-Z]";

  // Melakukan validasi password minimal memiliki satu huruf kecil
  static String? _containsLowercase(String? value) =>
      value!.contains(RegExp(r'[a-z]'))
          ? null
          : "Password harus memiliki minimal satu huruf kecil [a-z]";

  // Melakukan validasi password minimal memiliki satu karakter unik
  static String? _containsSpesialChar(String? value) =>
      value!.contains(RegExp(r'[!@#\$&*~]'))
          ? null
          : "Password harus memiliki minimal satu karakter spesial !@#\$&*~";

  PasswordValidator.create(String fieldName)
      : super._(fieldName, [
          ...ValueValidatorBuilder.create(fieldName)
              .notNull()
              .notEmpty()
              .minLengthOf(8)
              .validatorList,
          _containUpperCase,
          _containsLowercase,
          _containsSpesialChar
        ]);
}

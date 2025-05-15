import 'utils.dart';

String? requiredValidator(String? value, [String? message]) =>
    (value == null || value.isEmpty)
        ? (message ??
            (getCurrentLocalization() == 'id'
                ? 'Kolom tidak boleh kosong'
                : "Field can't be empty"))
        : null;
String? emailValidator(String? value) {
  RegExp regex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  if (value == null || value.isEmpty) {
    return getCurrentLocalization() == 'id'
        ? 'Kolom tidak boleh kosong'
        : "Field can't be empty";
  } else if (!regex.hasMatch(value)) {
    return getCurrentLocalization() == 'id'
        ? 'Email tidak valid'
        : 'Email not valid';
  }
  return null;
}

String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return getCurrentLocalization() == 'id'
        ? 'Kolom tidak boleh kosong'
        : "Field can't be empty";
  } else if (!value.startsWith('08')) {
    return getCurrentLocalization() == 'id'
        ? "Nomor harus berawalan '08', contoh: 08xxx"
        : "Phone numbers start with '08', e.g: 08xxx";
  } else if (value.length < 10) {
    return getCurrentLocalization() == 'id'
        ? 'Masukan minimal 10 karakter'
        : 'Please fill in at least 8 characters';
  }
  return null;
}

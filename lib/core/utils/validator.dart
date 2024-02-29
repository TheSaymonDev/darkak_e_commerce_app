String? passwordValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter a password.';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters long.';
  }
  return null;
}

String? nameValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your name.';
  }
  return null;
}

String? emailValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your email address.';
  }
  if (!RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')
      .hasMatch(value)) {
    return 'Please enter a valid email address.';
  }
  return null;
}

String? mobileValidator(value) {
  final RegExp bdNumberRegex = RegExp(r"^(?:\+?88|0088)?01[15-9]\d{8}$");
  if (value!.isEmpty) {
    return 'Please enter your mobile number.';
  }
  if (!bdNumberRegex.hasMatch(value)) {
    return 'Please enter a valid mobile number.';
  }
  return null;
}

String? pinValidator(value) {
  final RegExp pinRegex =
  RegExp(r'^[0-9]{4}$'); // 4-digit PIN (adjust regex if needed)
  if (value!.isEmpty) {
    return 'Please enter your PIN.';
  }
  if (!pinRegex.hasMatch(value)) {
    return 'Please enter a valid 4-digit PIN.'; // Adjust error message if needed
  }
  return null;
}

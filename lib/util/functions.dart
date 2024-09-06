// Validate Email
String? validateEmail(String email) {
  String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  if (email.isEmpty) {
    return 'Email is required';
  } else if (!RegExp(emailPattern).hasMatch(email)) {
    return 'Enter a valid email';
  }
  return null;
}

// Validate Mobile Number
String? validateMobileNumber(String mobileNumber) {
  if (mobileNumber.isEmpty) {
    return 'Mobile number is required';
  } else if (!mobileNumber.startsWith('+')) {
    return 'Mobile number should start with a + sign';
  }
  return null;
}

String? validateTwoDates(String firstDate, String secondDate, String secondDateLabel) {
  if (secondDate.isEmpty) {
    return 'Date is required';
  } else {
    try {
      DateTime first = DateTime.parse(firstDate);
      DateTime second = DateTime.parse(secondDate);

      if (second.isBefore(first)) {
        return 'Invalid $secondDateLabel';
      }
    } catch (e) {
      return 'Invalid date format';
    }
  }

  return null;
}
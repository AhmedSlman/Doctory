
class Validators {
  static String? validateEmail(String? value) {
    // Basic email validation regex
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (value == null || value.isEmpty) {
      return 'ادخل حسابك';
    } else if (!emailRegex.hasMatch(value)) {
      return 'الرجاء ادخال حساب صحيح';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    // Regex for Egyptian phone numbers
    final phoneRegex = RegExp(r'^01[0-9]{9}$');

    if (value == null || value.isEmpty) {
      return 'ادخل رقمك'; // Enter your number
    } else if (!phoneRegex.hasMatch(value)) {
      return 'ادخل رقم صحيح'; // Enter a valid number
    }
    return null;
  }
}

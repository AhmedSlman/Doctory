
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
    // Basic phone number validation regex (example for US phone numbers)
    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    if (value == null || value.isEmpty) {
      return 'ادخل رقمك';
    } else if (!phoneRegex.hasMatch(value)) {
      return 'ادخل حساب صحيح';
    }
    return null;
  }
}

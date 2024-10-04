import 'package:intl/intl.dart';

class AppConstFunctions{
  static String formatDate(String dobString) {
    try {
      final date = DateTime.parse(dobString);
      final formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(date);
    } catch (error) {
      // Handle parsing error (optional)
      print("Error parsing date: $error");
      return dobString; // Or return a default value
    }
  }
}
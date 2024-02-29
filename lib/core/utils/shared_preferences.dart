import 'package:shared_preferences/shared_preferences.dart';

Future<void> writeUserData(userData) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', userData['accessToken']);
  await prefs.setString('name', userData['user']['name']);
  await prefs.setString('mobile', userData['user']['mobile']);
  await prefs.setString('email', userData['user']['email']);
}

Future<String?> readUserData(key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? myData = await prefs.getString(key);
  return myData;
}

void logOut() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
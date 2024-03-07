import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesService {
//   static final SharedPreferencesService _instance = SharedPreferencesService._internal();
//
//   factory SharedPreferencesService() => _instance;
//
//   SharedPreferencesService._internal();
//
//   final _prefs = Future<SharedPreferences>.value(SharedPreferences.getInstance());
//
//   Future<void> saveUserData(Map<String, dynamic> userData) async {
//     final prefs = await _prefs;
//     prefs.setString('name', userData['user']['name']);
//     prefs.setString('mobile', userData['user']['mobile']);
//     prefs.setString('email', userData['user']['email']);
//   }
//
//   Future<String?> getUserName() async {
//     final prefs = await _prefs;
//     return prefs.getString('name');
//   }
//
//   Future<String?> getMobile() async {
//     final prefs = await _prefs;
//     return prefs.getString('mobile');
//   }
//
//   Future<String?> getEmail() async {
//     final prefs = await _prefs;
//     return prefs.getString('email');
//   }
//
//   Future<void> saveToken(String token) async {
//     final prefs = await _prefs;
//     prefs.setString('accessToken', token);
//   }
//
//   Future<String?> getToken() async {
//     final prefs = await _prefs;
//     return prefs.getString('accessToken');
//   }
//
//   Future<void> clearUserData() async {
//     final prefs = await _prefs;
//     prefs.clear();
//   }
// }

class SharedPreferencesService {
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();

  factory SharedPreferencesService() => _instance;

  SharedPreferencesService._internal();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String getUserName() {
    return _prefs.getString('name') ?? '';
  }

  String getMobile() {
    return _prefs.getString('mobile') ?? '';
  }

  String getEmail() {
    return _prefs.getString('email') ?? '';
  }

  String getId(){
    return _prefs.getString('id') ?? '';
  }

  void saveUserData(Map<String, dynamic> userData) {
    _prefs.setString('id', userData['user']['id'] ?? '');
    _prefs.setString('name', userData['user']['name'] ?? '');
    _prefs.setString('mobile', userData['user']['mobile'] ?? '');
    _prefs.setString('email', userData['user']['email'] ?? '');
  }

  void saveToken(String token) {
    _prefs.setString('accessToken', token);
  }

  String getToken() {
    return _prefs.getString('accessToken') ?? '';
  }

  void clearUserData() {
    _prefs.clear();
  }
}


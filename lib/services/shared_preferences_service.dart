import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesService {
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();
  factory SharedPreferencesService() => _instance;
  SharedPreferencesService._internal();
  late SharedPreferences _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void saveUserData(Map<String, dynamic> userData) {
    _prefs.setString('id', userData['user']['id'] ?? '');
  }
  String getId(){
    return _prefs.getString('id') ?? '';
  }
  
  void saveScreen(bool homeScreen){
    _prefs.setBool('showHome', homeScreen);
  }
  bool getSavedScreen(){
    return _prefs.getBool('showHome') ?? false;
  }

  void saveToken(String token) {
    _prefs.setString('accessToken', token);
  }
  String getToken() {
    return _prefs.getString('accessToken') ?? '';
  }

  void saveLocation(String location){
    _prefs.setString('savedLocation', location);
  }
  String getLocation(){
    return _prefs.getString('savedLocation') ?? '';
  }

  void clearUserData() {
    _prefs.remove('id');
   _prefs.remove('accessToken');
  }
}
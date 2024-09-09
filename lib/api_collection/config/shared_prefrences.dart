import 'package:quickmeds_user/api_collection/config/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  PreferenceManager._();

  static PreferenceManager? _instance;

  static PreferenceManager get() {
    _instance ??= PreferenceManager._();
    return _instance!;
  }

// !---------For Access Token---------
  Future setAccessToken(String token) async {
    (await SharedPreferences.getInstance())
        .setString(PreferenceConstants.ACCESS_TOKEN, token);
  }

  Future getAccessToken() async {
    return (await SharedPreferences.getInstance())
        .getString(PreferenceConstants.ACCESS_TOKEN);
  }

// !---------For OnBoarding---------
  Future getMainOnBoardValue() async {
    return (await SharedPreferences.getInstance())
        .getBool(PreferenceConstants.SHOW_ON_BOARD);
  }

  Future setMainOnBoardValue(bool value) async {
    (await SharedPreferences.getInstance())
        .setBool(PreferenceConstants.SHOW_ON_BOARD, value);
  }

// !---------For Setting Specific Value---------
  Future setSpecificValue(String key, String value) async {
    (await SharedPreferences.getInstance()).setString(key, value);
  }

  Future getSpecificValue(String key) async {
    return (await SharedPreferences.getInstance()).getString(key);
  }

// !---------For Removing Specific Key---------
// It means if you want to remove a specific key from shared preference
// It means when i remove access token then it will remove the access token from shared preference
  Future removeSpecificKey(String key) async {
    return (await SharedPreferences.getInstance()).remove(key);
  }

// But in case of clear it will remove all the keys from shared preference including access token
// !---------For Clearing All Values---------
  preferenceClear() async {
    (await SharedPreferences.getInstance()).clear();
  }
}

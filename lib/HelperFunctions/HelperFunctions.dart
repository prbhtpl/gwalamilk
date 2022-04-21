import 'package:shared_preferences/shared_preferences.dart';
class HelperFunctions{
  static String sharedPreferenceUserLoggedInKey = 'LOGGEDIN';
  static String sharedPreferenceCurrentUserkey = 'CurrentUserId';
  static Future<bool> saveuserLoggedInSharedPreference(
      bool isuserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPreferenceUserLoggedInKey, isuserLoggedIn);
  }
  static Future saveuserCurrentUserIdSharedPreference(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferenceCurrentUserkey, id);
  }
  //getting data
  static Future<bool?> getuserLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.getBool(sharedPreferenceUserLoggedInKey);
  }
  static Future<String?> getCurrentUserIdSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.getString(sharedPreferenceCurrentUserkey);
  }
}

import 'package:dot_connect_flutter/data/local/shared_preference/shared_pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

const prefError = "shared_pref_get_error";

Future<dynamic> getSharedPrefData(SharedPrefKeys key) async {
  final pref = await SharedPreferences.getInstance();

  try {
    switch (key.type) {
      case PrefTypes.bool:
        return pref.getBool(key.code);
      case PrefTypes.double:
        return pref.getDouble(key.code);
      case PrefTypes.int:
        return pref.getInt(key.code);
      case PrefTypes.string:
        return pref.getString(key.code);
      case PrefTypes.stringList:
        return pref.getStringList(key.code);
      case PrefTypes.undefined:
        return prefError;
      default:
        return prefError;
    }

  } catch (e) {
    return prefError;
  }
}


setSharedPrefBool(SharedPrefKeys key, bool data) async {
  try {
    final pref = await SharedPreferences.getInstance();

    pref.setBool(key.code, data);

  } catch (e) {
    print(e);
  }
}
setSharedPrefDouble(SharedPrefKeys key, double data) async {
  try {
    final pref = await SharedPreferences.getInstance();

    pref.setDouble(key.code, data);

  } catch (e) {
    print(e);
  }
}
setSharedPrefInt(SharedPrefKeys key, int data) async {
  try {
    final pref = await SharedPreferences.getInstance();

    pref.setInt(key.code, data);

  } catch (e) {
    print(e);
  }
}
setSharedPrefString(SharedPrefKeys key, String data) async {
  try {
    final pref = await SharedPreferences.getInstance();

    pref.setString(key.code, data);

  } catch (e) {
    print(e);
  }
}
setSharedPrefStringList(SharedPrefKeys key, List<String> data) async {
  try {
    final pref = await SharedPreferences.getInstance();

    pref.setStringList(key.code, data);

  } catch (e) {
    print(e);
  }
}
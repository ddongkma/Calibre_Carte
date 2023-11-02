

import 'package:shared_preferences/shared_preferences.dart';

import '../values/constant.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<String> getLayoutFromPreferences() async {
    return _prefs.getString(AppConstants.STORAGE_LAYOUT) ?? "list";

  }

  Future<bool> storeLayout( String key,String value) async {
   return await _prefs.setString(AppConstants.STORAGE_LAYOUT, value);
  }
  Future<String> getTokenFromPreferences() async {
    return _prefs.getString(AppConstants.STORAGE_TOKEN)??'';
  }
  Future<String> getSelectedLibPathFromSharedPrefs() async {
    return _prefs.getString(AppConstants.STORAGE_SELECTED_CALIBRE_LIB_PATH)??"";
  }
  Future<bool> saveBoolToSharedPrefs(String settingName, bool val) async {
    return await _prefs.setBool(AppConstants.STORAGE_DARKMODE, val);
  }

}
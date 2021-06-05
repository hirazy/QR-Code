import 'dart:async';
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceUtils {
  static SharedPreferences _preferences;

  static const _keyUserName = "username";

  static const _keyPassWord = "password";

  static const _keyPets = "pets";

  static const _keyBirthDay = "birthday";

  static const _keyTheme = "theme";

  static const _keyThemeColor = "themeColor";

  static const _keyMyQR = "myQR";

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUserName(String username) async {
    await _preferences.setString(_keyUserName, username);
  }

  static Future setPassWord(String password) async {
    await _preferences.setString(_keyPassWord, password);
  }

  static String getUserName() => _preferences.getString(_keyUserName);

  static String getPassWord() => _preferences.getString(_keyPassWord);

  static Future setPets(List<String> pets) async {
    await _preferences.setStringList(_keyPets, pets);
  }

  static Future setBirthday(DateTime dateOfBirth) async {
    final birthday = dateOfBirth.toIso8601String();
    await _preferences.setString(_keyBirthDay, birthday);
  }

  static DateTime getBirthDay() {
    final birthday = _preferences.getString(_keyBirthDay);
    return DateTime.tryParse(birthday);
  }

  static Future setColorTheme(int color) async {
    await _preferences.setInt(_keyThemeColor, color);
  }

  static int getColorTheme() => _preferences.getInt(_keyThemeColor) == null ? 0:  _preferences.getInt(_keyThemeColor);

  static Future setTheme(int theme) async {
    await _preferences.setInt(_keyTheme, theme);
  }

  static Future setMyQr(String qrCode) async {
    await _preferences.setString(_keyMyQR, qrCode);
  }

  static String getMyQr() => _preferences.getString(_keyMyQR) == null ? "" : _preferences.getString(_keyMyQR);
}

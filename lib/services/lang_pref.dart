import 'package:shared_preferences/shared_preferences.dart';

class LangPref {
  static SharedPreferences? _prefrences;

  static const _keyLang = 'Language';

  static Future init() async =>
      _prefrences = await SharedPreferences.getInstance();

  static Future setLang(String lang) async =>
      await _prefrences!.setString(_keyLang, lang);

  static Future getLang() async => await _prefrences!.getString(_keyLang);
}

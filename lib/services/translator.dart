import 'package:translator/translator.dart';

class trans {
  static GoogleTranslator translator = GoogleTranslator();

  static Future<String> translate(String text) async {
    String translated = 'Text';
    await translator.translate(text, to: "fr").then((value) {
      translated = value.toString();
    });
    return translated;
  }

  static Future<String> translateToEng(String text) async {
    String translated = 'Text';
    await translator.translate(text, to: "en").then((value) {
      translated = value.toString();
    });
    return translated;
  }
}

import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SettingsList(
          sections: [
            SettingsSection(
              tiles: [
                SettingsTile(
                  title: Text('Adai'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Afrikaans'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Albaamaha'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('العربية'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Arbërisht'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Bamanankan'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text(' बड़ो'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text(' 廣東話'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Chamoru'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Chikasha'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Dansk'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Deutsch'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Eesti'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('English'),
                  trailing: const Icon(Icons.check),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Espagnol'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('эвэн то̄рэ̄нни or эвэды'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Fala'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Furlan'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('赣语, 贛語'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Ελληνικά'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text(' 𐌲𐌿𐍄𐌹𐍃𐌺'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text(' ქართული'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('हिन्दुस्तानी'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('日本語'),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: Text('Līvõ Kēļ or Rāndakēļ'),
                  onPressed: (BuildContext context) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

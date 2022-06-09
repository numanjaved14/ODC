import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'language_page.dart';

class Settingspage extends StatelessWidget {
  const Settingspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Settings',
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('General'),
            // titleTextStyle: const TextStyle(
            //   color: kPrimaryColor,
            //   fontSize: 18,
            //   fontWeight: FontWeight.bold,
            // ),
            // titlePadding: const EdgeInsets.only(top: 16, left: 20, bottom: 8),
            tiles: [
              SettingsTile(
                title: Text('Language'),
                leading: const Icon(
                  Icons.language,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onPressed: (BuildContext context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LanguagePage();
                      },
                    ),
                  );
                },
              ),
              SettingsTile(
                title: Text('Display & Sounds'),
                leading: const Icon(
                  Icons.desktop_access_disabled_sharp,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: Text('Push Notifications'),
                leading: const Icon(Icons.notifications),
                initialValue: true,
                // switchValue: true,
                // switchActiveColor: kPrimaryColor,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: Text('Dark Mode'),
                leading: const Icon(Icons.mode_night_outlined),
                initialValue: true,
                // switchValue: true,
                // switchActiveColor: kPrimaryColor,
                onToggle: (bool value) {},
              ),
            ],
          ),
          SettingsSection(
            title: Text('Security'),
            // titleTextStyle: const TextStyle(
            //   color: kPrimaryColor,
            //   fontSize: 18,
            //   fontWeight: FontWeight.bold,
            // ),
            // titlePadding: const EdgeInsets.only(top: 16, left: 20, bottom: 8),
            tiles: [
              SettingsTile(
                title: Text('Privacy'),
                leading: const Icon(
                  Icons.privacy_tip,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: Text('Upload your informations'),
                leading: const Icon(
                  Icons.upload,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onPressed: (BuildContext context) {},
              ),
              // SettingsTile.switchTile(
              //   title: 'Use fingerprint',
              //   leading: const Icon(Icons.fingerprint),
              //   switchValue: true,
              //   switchActiveColor: kPrimaryColor,
              //   onToggle: (bool value) {},
              // ),
            ],
          ),
          SettingsSection(
            title: Text('Others'),
            // titleTextStyle: const TextStyle(
            //   color: kPrimaryColor,
            //   fontSize: 18,
            //   fontWeight: FontWeight.bold,
            // ),
            // titlePadding: const EdgeInsets.only(top: 16, left: 20, bottom: 8),
            tiles: [
              SettingsTile(
                title: Text('Personal history'),
                leading: const Icon(
                  Icons.list,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: Text('community standard'),
                leading: const Icon(
                  Icons.checklist_rounded,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: Text('Help'),
                leading: const Icon(
                  Icons.help,
                ),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

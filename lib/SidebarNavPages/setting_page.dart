import 'package:aces/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aces/settings_manager.dart';

import '../components/text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, required Null Function(dynamic ThemeMode) onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsManager>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Row(
          children: [
            CustomText(
              text: 'Settings',
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: settings.isDarkMode,
              onChanged: (value) => settings.toggleDarkMode(),
            ),
          ),
          ListTile(
            title: const Text('Language'),
            trailing: DropdownButton<Locale>(
              value: settings.currentLocale,
              onChanged: (locale) => settings.updateLocale(locale!),
              items: const [
                DropdownMenuItem(
                  value: Locale('en', ''),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('es', ''),
                  child: Text('Spanish'),
                ),
                DropdownMenuItem(
                  value: Locale('hi', ''),
                  child: Text('Hindi'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

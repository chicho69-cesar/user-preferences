import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:user_preferences/providers/theme_provider.dart';
import 'package:user_preferences/share-preferences/preferences.dart';
import 'package:user_preferences/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const String routeName = 'settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /* bool isDarkmode = false;
  int gender = 1;
  String name = 'Cesar'; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),

              const Divider(),

              SwitchListTile(
                value: Preferences.isDarkmode, 
                title: const Text('Darkmode'),
                onChanged: (value) {
                  setState(() {
                    Preferences.isDarkmode = value;
                    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

                    value 
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                  });
                }
              ),

              const Divider(),

              RadioListTile<int>(
                value: 1, // 1 - Masculino y 2 - Femenino
                groupValue: Preferences.gender, 
                title: const Text('Masculino'),
                onChanged: (value) {
                  setState(() {
                    Preferences.gender = value ?? 1;
                  });
                }
              ),

              const Divider(),

              RadioListTile<int>(
                value: 2, // 1 - Masculino y 2 - Femenino
                groupValue: Preferences.gender, 
                title: const Text('Femenino'),
                onChanged: (value) {
                  setState(() {
                    Preferences.gender = value ?? 2;
                  });
                }
              ),

              const Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value) {
                    setState(() {
                      Preferences.name = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre del usuario'
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

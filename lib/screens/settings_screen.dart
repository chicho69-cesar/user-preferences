import 'package:flutter/material.dart';

import 'package:user_preferences/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const String routeName = 'settings';
  
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
                value: true, 
                title: const Text('Darkmode'),
                onChanged: (value) {

                }
              ),

              const Divider(),

              RadioListTile<int>(
                value: 1, // 1 - Masculino y 2 - Femenino
                groupValue: 1, 
                title: const Text('Masculino'),
                onChanged: (value) {

                }
              ),

              const Divider(),

              RadioListTile<int>(
                value: 2, // 1 - Masculino y 2 - Femenino
                groupValue: 1, 
                title: const Text('Femenino'),
                onChanged: (value) {

                }
              ),

              const Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: 'Cesar',
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

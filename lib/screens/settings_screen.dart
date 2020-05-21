import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'languages_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings UI')),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Common',
            tiles: [
              SettingsTile(
                title: 'Idioma',
                subtitle: 'Español',
                leading: Icon(Icons.language),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LanguagesScreen()));
                },
              ),
              SettingsTile(
                title: 'Unidades',
                subtitle: 'Kilometros',
                leading: Icon(Icons.directions_run),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LanguagesScreen()));
                },
              ),

            ],
          ),
          SettingsSection(
            title: 'Cuenta',
            tiles: [
              SettingsTile(title: 'Número de Teléfono', leading: Icon(Icons.phone)),
              SettingsTile(title: 'Mi Información', leading: Icon(Icons.email)),
              SettingsTile(title: 'Cambiar Contraseña', leading: Icon(Icons.lock)),
              SettingsTile(title: 'Cerrar Sesión', leading: Icon(Icons.exit_to_app)),

            ],
          ),

          SettingsSection(
            title: 'Misc',
            tiles: [
              SettingsTile(
                  title: 'Terminos de privacidad', leading: Icon(Icons.description)),

            ],
          )
        ],
      ),
    );
  }
}

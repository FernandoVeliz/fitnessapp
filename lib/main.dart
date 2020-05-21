// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:fitness/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness/settings_ui.dart';
import 'package:fitness/bezier_chart.dart';
import 'package:intl/intl.dart' as intl;
import 'sample10.dart';
import 'screens/settings_screen.dart';
import 'screens/languages_screen.dart';
import 'dart:async';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Fitness App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static List<Widget> _widgetOptions = <Widget>[
    Container(
      width: 350,
      height: 350,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.blue,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Tip del día',
                  textAlign: TextAlign.center, style: optionStyle),
              subtitle: Text(
                '\n\n\n\n\nCamina o súbete a una bici o elíptica por 10 minutos a intensidad ligera. Al terminar, mueve todas las articulaciones del cuerpo: hombros, codos, muñecas, cuello, cintura, cadera, rodillas, tobillos; 15 a 20 veces cada una por 3 series.',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),

    Container(
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.green,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Descuento disponible',
                  style: TextStyle(color: Colors.white)),
              subtitle: Text(
                '300.00 MXN',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Ver código',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),

    Scaffold(
      /*body: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Container()
          ],
        )
      ],),*/
      //Este jala
      body: Center(
        child: Text(
          'Tiempo: 00:00:00\nDistancia: 00.00 KM',
          textAlign: TextAlign.justify,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.timer),
        backgroundColor: Colors.red,
      ),
    ),
    /*Stack(
      children: <Widget>[
        Text(
          'Tiempo: 00:00:00\nDistancia: 00.00 KM', textAlign: TextAlign.center,
          style: optionStyle,
        ),
        FloatingActionButton(
          child: Icon(Icons.navigation),
          backgroundColor: Colors.green,
        )
      ],
    ),*/


    //Estadisticas
    Container(
      child: Sample10(),
    ),

    //Opciones
    Container(child: SettingsScreen(),)
    /*SettingsList(
      sections: [
        SettingsSection(
          title: 'General',
          tiles: [
            SettingsTile(
              title: 'Idioma',
              subtitle: 'Español',
              leading: Icon(Icons.language),
              onTap: () {},
            ),
          ],
        ),
      ],
    )*/

    /*Container(
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.green,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Descuento disponible',
                  style: TextStyle(color: Colors.white)),
              subtitle: Text(
                '300.00 MXN',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Ver código',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),*/
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            title: Text('Tips'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            title: Text('Descuentos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            title: Text('Actividad'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart), title: Text("Estadísticas")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Opciones")),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

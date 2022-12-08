import 'package:flutter/material.dart';
import 'package:sesion6_ud3/pages/producto/create_page.dart';
import 'package:sesion6_ud3/pages/producto/productos_page.dart';

class Menupage extends StatefulWidget {
  const Menupage({super.key});

  @override
  State<Menupage> createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ProductosPage(),
    CreatePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 3, 182, 222),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'PERFILES',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'AÑADIR PERFIL',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        onTap: _onItemTapped,
      ),
    );
  }
}
